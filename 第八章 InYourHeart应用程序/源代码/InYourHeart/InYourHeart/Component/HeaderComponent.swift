//
//  HeaderComponent.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/15.
//

import SwiftUI

struct HeaderComponent: View {
  //MARK: - Body
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Capsule()
        .frame(width: 128, height: 6)
        .foregroundColor(.secondary)
        .opacity(0.2)
      
      Image("logo-InYourHeart")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
    }
  }
}

//MARK: - Preview
struct HeaderComponent_Previews: PreviewProvider {
  static var previews: some View {
    HeaderComponent()
      .previewLayout(.fixed(width: 375, height: 128))
  }
}
