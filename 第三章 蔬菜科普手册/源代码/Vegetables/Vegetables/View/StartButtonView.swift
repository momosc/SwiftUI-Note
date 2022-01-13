//
//  StartButtonView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/20.
//

import SwiftUI

struct StartButtonView: View {
  // MARK: - Properties
  @AppStorage("isOnboarding") var isOnboarding: Bool?
  
  // MARK: - Body
  var body: some View {
    Button(action: {
      isOnboarding = false
    }) {
      HStack(spacing: 8) {
        Text("开始")
        
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(Capsule().strokeBorder(Color.white, lineWidth: 1.25))
    }
    .accentColor(.white)
  }
}


// MARK: - Preview
struct StartButtonView_Previews: PreviewProvider {
  static var previews: some View {
    StartButtonView()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
