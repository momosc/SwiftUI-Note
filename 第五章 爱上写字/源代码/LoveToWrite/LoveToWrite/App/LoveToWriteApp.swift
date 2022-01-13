//
//  LoveToWriteApp.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/19.
//

import SwiftUI

@main
struct LoveToWriteApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(Shop())
    }
  }
}
