//
//  AddToCartDetailView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/22.
//

import SwiftUI

struct AddToCartDetailView: View {
  // MARK: - Properties
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  var body: some View {
    Button(action: {
      feedback.impactOccurred()
    }, label: {
      Spacer()
      Text("添加到购物车")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.white)
      Spacer()
    })
    .padding(15)
    .background(
      Color(red: shop.selectedPen?.red ?? samplePen.red,
            green: shop.selectedPen?.green ?? samplePen.green,
            blue: shop.selectedPen?.blue ?? samplePen.blue)
    )
    .clipShape(Capsule())
  }
}

// MARK: - Preview
struct AddToCartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AddToCartDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
