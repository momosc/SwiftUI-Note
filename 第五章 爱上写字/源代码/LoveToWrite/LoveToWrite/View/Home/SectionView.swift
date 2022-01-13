//
//  SectionView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/20.
//

import SwiftUI

struct SectionView: View {
  // MARK: - Properties
  @State var rotateClockwise: Bool
  
  // MARK: - Body
  var body: some View {
    VStack(spacing: 0) {
      Spacer()
      Text("文具分类列表")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
      Spacer()
    } //: VStack
    .background(colorGray.cornerRadius(12))
    .frame(width: 85)
  }
}

// MARK: - Preview
struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(rotateClockwise: true)
      .previewLayout(.fixed(width: 120, height: 240))
      .padding()
      .background(colorBackground)
  }
}
