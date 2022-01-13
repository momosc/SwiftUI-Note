//
//  Extensions.swift
//  FruitMachine
//
//  Created by 刘铭 on 2021/3/11.
//

import SwiftUI

extension Text {
  func scoreLableStyle() -> Text {
    self
      .foregroundColor(.white)
      .font(.system(size: 10, weight: .bold, design: .rounded))
  }
  
  func scoreNumberStyle() -> Text {
    self
      .foregroundColor(.white)
      .font(.system(.title, design: .rounded))
      .fontWeight(.heavy)
  }
}
