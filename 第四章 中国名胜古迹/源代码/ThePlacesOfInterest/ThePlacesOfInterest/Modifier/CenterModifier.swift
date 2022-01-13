//
//  CenterModifier.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
