//
//  TopPartDetailView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/21.
//

import SwiftUI

struct TopPartDetailView: View {
  // MARK: - Properties
  @State private var isAnimating: Bool = false
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  var body: some View {
    HStack(alignment:.center, spacing: 6) {
      // 价格
      VStack(alignment:.leading, spacing: 6) {
        Text("单价")
          .fontWeight(.semibold)
        Text(shop.selectedPen?.formattedPrice ?? samplePen.formattedPrice)
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
      } //: VStack
      .offset(y: isAnimating ? -50 : -75)
      Spacer()
      // 图片
      Image(shop.selectedPen?.image ?? samplePen.image)
        .resizable()
        .scaledToFit()
        .offset(y: isAnimating ? 0 : -35)
    } //: HStack
    .onAppear(){
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimating.toggle()
      }
    }
  }
}
// MARK: - Preview
struct TopPartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopPartDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
