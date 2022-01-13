//
//  ContentView.swift
//  Todo
//
//  Created by 刘铭 on 2021/3/21.
//

import SwiftUI

struct ContentView: View {
  //MARK: - Properties
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @FetchRequest(entity: E_Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \E_Todo.name, ascending: true)]) var todos: FetchedResults<E_Todo>
  
  @EnvironmentObject var iconSettings: IconNames
  
  @State private var showingAddTodoView = false
  @State private var animatingButton = false
  
  @State private var showingSettingsView = false
  
  // Theme
  @ObservedObject var theme = ThemeSettings.shared
  var themes: [Theme] = themeData
  
  
  //MARK: - Body
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(self.todos, id:\.self) { todo in
            HStack {
              Circle()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(self.colorize(priority: todo.priority ?? "标准"))
              
              Text(todo.name ?? "未知")
                .fontWeight(.semibold)
              
              Spacer()
              Text(todo.priority ?? "未知")
                .font(.footnote)
                .foregroundColor(Color(UIColor.systemGray2))
                .padding(3)
                .frame(minWidth: 62)
                .overlay(
                  Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                )
            } //: HStack
            .padding(.vertical, 10)
          } //: Loop
          .onDelete(perform: deleteTodo)
        } //: List
        .navigationBarTitle("待办事项", displayMode: .inline)
        .listStyle(PlainListStyle())
        .navigationBarItems(
          leading: EditButton()/*.accentColor(themes[self.theme.themeSettings].themeColor)*/,
          trailing:
            Button(action: {
              self.showingSettingsView.toggle()
            }, label: {
              Image(systemName: "paintbrush")
            }) //: Button
            //.accentColor(themes[self.theme.themeSettings].themeColor)
            .sheet(isPresented: $showingSettingsView, content: {
              SettingsView().environmentObject(self.iconSettings)
            })
      )
        
        // MARK: - 没有数据记录的情况
        if todos.count == 0 {
          EmptyListView()
        } //: Ifend
      } //: ZStack
      .sheet(isPresented: $showingAddTodoView, content: {
        AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
      })
      .overlay(
        ZStack {
          Group {
            Circle()
              .fill(themes[self.theme.themeSettings].themeColor)
              .opacity(animatingButton ? 0.2 : 0)
              .scaleEffect(animatingButton ? 1 : 0)
              .frame(width: 68, height: 68, alignment: .center)
            Circle()
              .fill(themes[self.theme.themeSettings].themeColor)
              .opacity(self.animatingButton ? 0.15 : 0)
              .scaleEffect(self.animatingButton ? 1 : 0)
              .frame(width: 88, height: 88, alignment: .center)
          }
          .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animatingButton)
          
          Button(action: {
            self.showingAddTodoView.toggle()
          }, label: {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .scaledToFit()
              .background(Circle().fill(Color("ColorBase")))
              .frame(width: 48, height: 48, alignment: .center)
          })
          .accentColor(themes[self.theme.themeSettings].themeColor)
          .onAppear{
            animatingButton.toggle()
          }
        } //: ZStack
        .padding(.bottom, 15)
        .padding(.trailing, 15)
        ,alignment: .bottomTrailing
      )
    } //: Navigation
  }
  
  // MARK: - Functions
  private func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = todos[index]
      managedObjectContext.delete(todo)
      
      do {
        try managedObjectContext.save()
      } catch {
        print(error)
      }
    } //: Loop
  }
  
  private func colorize(priority: String) -> Color {
    switch priority {
    case "高":
      return .pink
    case "标准":
      return .green
    case "低":
      return .blue
    default:
      return .gray
    }
  }
  
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let context = PersistenceController.shared.container.viewContext
    ContentView()
      .environment(\.managedObjectContext, context)
  }
}
