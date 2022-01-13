//
//  HeaderDetailView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/21.
//

import SwiftUI

struct HeaderDetailView: View {
  // MARK: - Properties
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text("书写用品")
      Text(shop.selectedPen?.name ?? samplePen.name)
        .font(.largeTitle)
        .fontWeight(.black)
    } //: VStack
    .foregroundColor(.white)
  }
}

// MARK: - Preview
struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color.gray)
  }
}
