//
//  CopyRightView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/20.
//

import SwiftUI

struct CopyrightView: View {
  var body: some View {
    VStack {
      Image("launch-screen-image")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      Text("""
        Copyright © liuming happy

        感谢所有购买此书的朋友们！❤️
        祝贺你们能够完成本章的学习！
      """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    } //: VStack
    .padding()
    .opacity(0.4)
  }
}

struct CopyrightView_Previews: PreviewProvider {
  static var previews: some View {
    CopyrightView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
