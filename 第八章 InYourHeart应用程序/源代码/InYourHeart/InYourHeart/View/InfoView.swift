//
//  InfoView.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/18.
//

import SwiftUI

struct InfoView: View {
  // MARK: - Properties
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - Body 
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        HeaderComponent()
        
        Spacer(minLength: 10)

        Text("应用程序信息")
          .fontWeight(.black)
          .modifier(TitleModifier())
        
        AppInfoView()
        
        Text("职员表")
          .fontWeight(.black)
          .modifier(TitleModifier())
        
        HStack {
          Text("照片提供人").foregroundColor(.gray)
          Spacer()
          Text("liuming")
        }
        
        Spacer(minLength: 10)
        
        Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("让我们继续")
            .modifier(ButtonModifier())
        })
      } //: VStack
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.top, 15)
      .padding(.bottom, 25)
      .padding(.horizontal, 25)
    } //: ScrollView
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}

struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(itemOne: "应用程序", itemTow: "在你心中")
      RowAppInfoView(itemOne: "兼容性", itemTow: "iPhone")
      RowAppInfoView(itemOne: "开发者", itemTow: "liuming / Oscar")
      RowAppInfoView(itemOne: "设计者", itemTow: "liuming / Happy")
      RowAppInfoView(itemOne: "网址", itemTow: "liuming.cn")
      RowAppInfoView(itemOne: "版本", itemTow: "1.0.0")
    }
  }
}

struct RowAppInfoView: View {
  // MARK: - Properties
  var itemOne: String
  var itemTow: String
  
  // MARK: - Body
  var body: some View {
    VStack {
      HStack {
        Text(itemOne).foregroundColor(.gray)
        Spacer()
        Text(itemTow)
      } //: HStack
      Divider()
    } //: VStack
  }
}
