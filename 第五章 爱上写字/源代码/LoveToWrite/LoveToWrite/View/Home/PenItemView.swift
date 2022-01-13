//
//  PenItemView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/21.
//

import SwiftUI

struct PenItemView: View {
  // MARK: - Properties
  let pen: Pen
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      // 图片
      ZStack {
        Image(pen.image)
          .resizable()
          .scaledToFit()
          .padding(10)
      } //: ZStack
      .background(Color(red: pen.red, green: pen.green, blue: pen.blue))
      .cornerRadius(12)
      
      // 标题
      Text(pen.name)
        .font(.title3)
        .fontWeight(.black)

      // 价格
      Text(pen.formattedPrice)
        .fontWeight(.semibold)
        .foregroundColor(.gray)
    } //: VStack
  }
}

// MARK: - Preview
struct PenItemView_Previews: PreviewProvider {
  static var previews: some View {
    PenItemView(pen: pens[1])
      .previewLayout(.fixed(width: 200, height: 300))
      .padding()
      .background(colorBackground)
  }
}
