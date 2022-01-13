//
//  HeaderItemView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/20.
//

import SwiftUI

struct HeaderItemView: View {
  // MARK: - Properties
  let header: Header
  
  // MARK: - Body
  var body: some View {
    Image(header.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: - Preview
struct HeaderItemView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderItemView(header: headers[1])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
