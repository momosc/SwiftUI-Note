//
//  SettingsView.swift
//  Todo
//
//  Created by 刘铭 on 2021/4/1.
//

import SwiftUI

struct SettingsView: View {
  //MARK: - Properties
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var iconSettings: IconNames
  
  // 颜色主题
  let themes: [Theme] = themeData
  @ObservedObject var theme = ThemeSettings.shared
  
  @State private var isThemeChanged = false
  
  //MARK: - Body
  var body: some View {
    NavigationView {
      VStack(alignment:.center, spacing:0) {
        Form {
          // MARK: - 第一部分
          Section(header: Text("选择应用程序图标")) {
            Picker(selection: $iconSettings.currentIndex, label:
                    HStack {
                      ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                          .strokeBorder(Color.primary, lineWidth: 2)
                        
                        Image(systemName: "paintbrush")
                          .font(.system(size: 28, weight: .regular, design: .default))
                          .foregroundColor(.primary)
                      } //: ZStack
                      .frame(width: 44, height: 44)
                      
                      Text("应用程序图标")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    } //: HStack
            
            ) {
              ForEach(0..<iconSettings.iconNames.count) { index in
                HStack {
                  Image(uiImage:
                          UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .cornerRadius(3)
                  
                  Spacer().frame(width: 8)
                  Text(self.iconSettings.iconNames[index] ?? "Blue")
                    .frame(alignment: .leading)
                } //: HStack
              } //: Loop
            } //: Picker
            .onReceive([self.iconSettings.currentIndex].publisher.first()) { value in
              let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
              if index != value {
                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { (error) in
                  if let error = error {
                    print(error.localizedDescription)
                  }else {
                    print("您成功修改了应用程序图标。")
                  } //: Ifend
                }
              } //: Ifend
            } //: onReceive
          }
          
          //MARK: - 第二部分
          Section(
            header:
              HStack {
                Text("选择应用程序的配色主题")
                
                Image(systemName: "circle.fill")
                  .resizable()
                  .frame(width: 10, height: 10)
                  .foregroundColor(themes[self.theme.themeSettings].themeColor)
              }
          ) {
            List(themes) { item in
              Button(action: {
                self.theme.themeSettings = item.id
                self.isThemeChanged.toggle()
              }, label: {
                HStack {
                  Image(systemName: "circle.fill")
                    .foregroundColor(item.themeColor)
                  Text(item.themeName)
                } //: HStack
              })
              .accentColor(Color.primary)
            }
          }
          .padding(.vertical, 3)
          .alert(isPresented: $isThemeChanged, content: {
            Alert(
              title: Text("成功！"),
              message: Text("应用程序的颜色主题已经被修改为\n\(self.themes[theme.themeSettings].themeName)"),
              dismissButton: .default(Text("OK")))
          })
          
          //MARK: - 第三部分
          Section(header: Text("欢迎关注以下社交媒体")) {
            FormRowLinkView(icon: "globe", color: .pink, text: "网址", link: "https://www.baidu.com")
            FormRowLinkView(icon: "link", color: .blue, text: "微博", link: "https://www.baidu.com")
            FormRowLinkView(icon: "play.rectangle", color: .green, text: "微信", link: "https://www.baidu.com")
          }
          .padding(.vertical, 3)
          
          //MARK: - 第四部分
          Section(header: Text("关于应用程序")) {
            FormRowStaticView(icon: "gear", firstText: "应用程序", secondText: "待办事项")
            FormRowStaticView(icon: "checkmark.seal", firstText: "兼容性", secondText: "iPhone, iPad")
            FormRowStaticView(icon: "keyboard", firstText: "开发人员", secondText: "liuming/ Happy")
            FormRowStaticView(icon: "paintbrush", firstText: "设计人员", secondText: "Oscar")
            FormRowStaticView(icon: "flag", firstText: "版本", secondText: "1.0.0")
          }
          .padding(.vertical, 3)
        } //: Form
      } //: VStack
      .navigationBarItems(trailing:
                            Button(action: {
                              self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                              Image(systemName: "xmark")
                            })
      )
      .navigationBarTitle("设置", displayMode: .inline)
      .background(Color("ColorBackground"))
      .edgesIgnoringSafeArea(.all)
    } //: Navigation
    .accentColor(themes[self.theme.themeSettings].themeColor)
  }
}

//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView().environmentObject(IconNames())
  }
}
