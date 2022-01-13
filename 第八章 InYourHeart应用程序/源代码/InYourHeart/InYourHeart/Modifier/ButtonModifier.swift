//
//  ButtonModifier.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/18.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(
        Capsule().fill(Color.pink)
      )
      .foregroundColor(.white)
  }
}
