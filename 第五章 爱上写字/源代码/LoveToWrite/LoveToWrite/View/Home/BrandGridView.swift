//
//  BrandGridView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/21.
//

import SwiftUI

struct BrandGridView: View {
  // MARK: - Properties
  
  // MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
        ForEach(brands) { item in
          BrandItemView(brand: item)
        } //: Loop
      } //: Grid
      .frame(height: 200)
      .padding(15)
    } //: ScrollView
  }
}

// MARK: - Preview
struct BrandGridView_Previews: PreviewProvider {
  static var previews: some View {
    BrandGridView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
