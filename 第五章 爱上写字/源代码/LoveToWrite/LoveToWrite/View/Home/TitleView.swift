//
//  TitleView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/21.
//

import SwiftUI

struct TitleView: View {
  // MARK: - Properties
  let title: String
  
  // MARK: - Body
  var body: some View {
    HStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.heavy)
      
      Spacer()
    }
    .padding(.horizontal)
    .padding(.top, 15)
    .padding(.bottom, 10)
  }
}

// MARK: - Preview
struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView(title: "钢 笔")
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
