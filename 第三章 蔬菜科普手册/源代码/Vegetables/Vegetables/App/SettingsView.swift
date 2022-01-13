//
//  SettingsView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/27.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - Properties
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          // MARK: - 第一部分
          GroupBox(
            label: SettingsLabelView(labelText: "蔬菜百科", labelImage: "info.circle")) {
            Divider().padding(.vertical, 4)
            
            HStack(alignment: .center, spacing: 10 ){
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              
              Text("蔬菜是指可以做菜、烹饪成为食品的一类植物或菌类，蔬菜是人们日常饮食中必不可少的食物之一。蔬菜可提供人体所必需的多种维生素和矿物质等营养物质。本App的目的就是让更多的人了解每种蔬菜的特性。")
                .font(.footnote)
            }
          }
          
          // MARK: - 第二部分
          GroupBox(label: SettingsLabelView(labelText: "定制化", labelImage: "paintbrush")) {
            Divider().padding(.vertical, 4)
            
            Text("如果需要，那么你可以通过这个开关来重置引导页面。")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("引导页面已重置").fontWeight(.bold)
                  .foregroundColor(Color.green)
              } else {
                Text("重置引导页面").fontWeight(.bold)
                  .foregroundColor(Color.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
            
          }
          
          // MARK: - 第三部分
          GroupBox(label: SettingsLabelView(labelText: "应用程序", labelImage: "apps.iphone")) {
            SettingsRowView(name: "开发者", content: "liuming / Happy")
            SettingsRowView(name: "设计者", content: "Oscar")
            SettingsRowView(name: "兼容性", content: "iOS 14")
            SettingsRowView(name: "网站", linkLabel: "百度", linkDestination: "www.baidu.com")
            SettingsRowView(name: "微博", linkLabel: "@刘铭", linkDestination: "weibo.com")
            SettingsRowView(name: "SwiftUI", content: "1.0")
            SettingsRowView(name: "版本", content: "1.3.0")
          }
        } //: VStack
        .navigationBarTitle(Text("设置"), displayMode: .large)
        .navigationBarItems(trailing:
                              Button(action: {
                                // 退出该视图
                                presentationMode.wrappedValue.dismiss()
                              }){
                                Image(systemName: "xmark")
                              }
        )
        .padding()
      } //: ScrollView
    } //: NavigationView
  }
}

// MARK: - Preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .preferredColorScheme(.light)
      .previewDevice("iPhone 11 Pro")
  }
}
