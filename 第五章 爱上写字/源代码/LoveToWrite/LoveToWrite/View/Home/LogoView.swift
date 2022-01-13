//
//  LogoView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/20.
//

import SwiftUI

struct LogoView: View {
  // MARK: - Properties
  
  // MARK: - Body
  var body: some View {
    HStack(spacing: 4) {
      Text("爱上")
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
      
      Image("Logo-Dark")
        .resizable()
        .scaledToFit()
        .frame(width: 30, height: 30, alignment: .center)
      
      Text("写字")
        .font(.title3)
        .fontWeight(.black)
        .foregroundColor(.black)
    } //: HStack
  }
}

// MARK: - Preview
struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
