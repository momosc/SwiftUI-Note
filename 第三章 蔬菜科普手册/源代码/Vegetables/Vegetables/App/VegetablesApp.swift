//
//  VegetablesApp.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/18.
//

import SwiftUI

@main
struct VegetablesApp: App {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnboardingView(vegetables: vegetablesData)
      }else {
        ContentView()
      }
    }
  }
}
