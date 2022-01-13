//
//  TitleModifier.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/18.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title)
      .foregroundColor(.pink)
  }
}
