//
//  PenDetailView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/21.
//

import SwiftUI

struct PenDetailView: View {
  // MARK: - Properties
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      // 导航栏
      NavigationBarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
      
      // Header
      HeaderDetailView()
        .padding(.horizontal)
      
      // Top Part
      TopPartDetailView()
        .padding(.horizontal)
        .zIndex(1)
      
      // Bottom Part
      VStack(alignment: .center, spacing: 0) {
        // 评星 & 笔尖规格
        RatingsSizesDetailView()
          .padding(.top, 20)
          .padding(.bottom, 10)
        
        // 描述
        ScrollView(.vertical, showsIndicators: false, content: {
          Text(shop.selectedPen?.description ?? samplePen.description)
            .font(.subheadline)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        })
        
        // 数量和设为最爱
        QuantityFavouriteDetailView()
          .padding(.vertical, 10)
        
        // 购物车
        AddToCartDetailView()
          .padding(.bottom, 20)
      } //: VStack
      .padding(.horizontal)
      .background(
        Color.white.clipShape(CustomShape()).padding(.top, -105)
      )
      .zIndex(0)
    } //: VStack
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedPen?.red ?? samplePen.red,
        green: shop.selectedPen?.green ?? samplePen.green,
        blue: shop.selectedPen?.blue ?? samplePen.blue)
    ).ignoresSafeArea(.all, edges: .all)
  }
}

// MARK: - Preview
struct PenDetailView_Previews: PreviewProvider {
  static var previews: some View {
    PenDetailView()
      .environmentObject(Shop())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
