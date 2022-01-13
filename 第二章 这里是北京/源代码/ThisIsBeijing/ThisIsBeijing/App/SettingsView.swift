//
//  SettingsView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/10.
//

import SwiftUI

struct SettingsView: View {
  //MARK: - Properties
  @State private var enableNotification = true
  @State private var backgroundRefresh = false
  
  //MARK: - Body
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      // MARK: - Header
      VStack(alignment: .center, spacing: 5) {
        Image("Beijing-Logo")
          .resizable()
          .scaledToFit()
          .padding(.top)
          .frame(width: 100, height: 100, alignment: .center)
          .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
        
        Text("这里是北京")
          .font(.title)
          .fontWeight(.light)
          .foregroundColor(Color("ColorBrownAdaptive"))
      } //: VStack
      .padding()
      
      // MARK: - Form
      Form {
        // MARK: - 第一部分
        Section(header: Text("通用设置")){
          Toggle(isOn: $enableNotification) {
            Text("启用消息通知")
          }
          Toggle(isOn: $backgroundRefresh) {
            Text("刷新背景")
          }
        } //: Section
        
        // MARK: - 第二部分
        Section(header: Text("应用程序")) {
          if enableNotification {
            HStack {
              Text("开发者").foregroundColor(.gray)
              Spacer()
              Text("liuming / Happy")
            }
            HStack {
              Text("设计者").foregroundColor(.gray)
              Spacer()
              Text("Oscar")
            }
            HStack {
              Text("兼容性").foregroundColor(.gray)
              Spacer()
              Text("iOS 14")
            }
            HStack {
              Text("SwiftUI").foregroundColor(.gray)
              Spacer()
              Text("2.0")
            }
            HStack {
              Text("版本").foregroundColor(.gray)
              Spacer()
              Text("1.2.0")
            }
          } else {
            HStack {
              Text("私人信息").foregroundColor(.gray)
              Spacer()
              Text("希望你能够喜欢本章的学习👍")
            }
          }
          
        }
      } //: Form
    } //: VStack
    .frame(maxWidth: 640)
  }
}

//MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
