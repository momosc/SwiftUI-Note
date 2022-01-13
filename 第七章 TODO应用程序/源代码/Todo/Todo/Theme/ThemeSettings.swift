//
//  ThemeSettings.swift
//  Todo
//
//  Created by 刘铭 on 2021/4/2.
//

import SwiftUI

//MARK: - Theme Settings

class ThemeSettings: ObservableObject {
  @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
  
  public static let shared = ThemeSettings()
}
