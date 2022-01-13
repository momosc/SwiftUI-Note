//
//  AddTodoView.swift
//  Todo
//
//  Created by 刘铭 on 2021/3/24.
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - Properties
  @Environment(\.managedObjectContext) var managedObjectContext
  @Environment(\.presentationMode) var presentationMode
  
  @State private var name = ""
  @State private var priority = "标准"
  
  @State private var errorShowing = false
  @State private var errorTitle = ""
  @State private var errorMessage = ""
  
  // Theme
  @ObservedObject var theme = ThemeSettings.shared
  var themes: [Theme] = themeData
  
  let priorities = ["高", "标准", "低"]
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      VStack {
        VStack(alignment: .leading, spacing: 20) {
          //MARK: - Todo Name
          TextField("待办事项", text: $name)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            .font(.system(size: 24, weight: .bold, design: .default))
          
          //MARK: - 优先级
          Picker("优先级", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
          //MARK: - 保存按钮
          Button(action: {
            //print("保存一个新的待办事项")
            if self.name != "" {
              let todo = E_Todo(context: self.managedObjectContext)
              todo.name = self.name
              todo.priority = self.priority
              
              do {
                try self.managedObjectContext.save()
                print("新的待办事项：\(todo.name ?? ""), \(todo.priority ?? "")")
              } catch {
                print(error)
              }
            } else {
              self.errorShowing = true
              self.errorTitle = "无效的名称"
              self.errorMessage = "请确保你输入的内容是\n待办事项必须的。"
              return
            }
            self.presentationMode.wrappedValue.dismiss()
          }, label: {
            Text("保存")
              .font(.system(size: 24, weight: .bold, design: .default))
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(themes[self.theme.themeSettings].themeColor)
              .cornerRadius(9)
              .foregroundColor(.white)
          }) //: 保存按钮
          
          Spacer()
        } //: VStack
        .padding(.horizontal)
        .padding(.vertical, 30)
      } //: VStack
      .navigationBarTitle("新的任务", displayMode: .inline)
      .navigationBarItems(trailing:
                            Button(action: {
                              self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                              Image(systemName: "xmark")
                            })
      )
      .alert(isPresented: $errorShowing) {
        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("确认")))
      }
    } //: Navigation
    .accentColor(themes[self.theme.themeSettings].themeColor)
  }
}

// MARK: - Preview
struct AddTodoView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoView()
  }
}
