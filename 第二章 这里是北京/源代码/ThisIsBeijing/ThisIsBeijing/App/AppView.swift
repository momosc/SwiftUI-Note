//
//  AppView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/10.
//

import SwiftUI

struct AppView: View {
  //MARK: - Body
  var body: some View {
    TabView {
      BeijingView()
        .tabItem({
          Image("TabIcon-Beijing")
          Text("北京")
        })
      FoodView()
        .tabItem {
          Image("TabIcon-Food")
          Text("小吃")
        }
      HutongView()
        .tabItem {
          Image("TabIcon-Hutong")
          Text("胡同")
        }
      SettingsView()
        .tabItem {
          Image("TabIcon-Settings")
          Text("设置")
        }
    }
    .edgesIgnoringSafeArea(.top)
    .accentColor(Color.primary)
  }
}

//MARK: - Preview
struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AppView()
        .preferredColorScheme(.light)
      AppView()
        .preferredColorScheme(.dark)
    }
  }
}
