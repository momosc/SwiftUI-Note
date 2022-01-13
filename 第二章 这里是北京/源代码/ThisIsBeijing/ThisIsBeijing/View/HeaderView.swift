//
//  HeaderView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/12.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - Properties
  @State private var showHeadline: Bool = false
  var header: Header
  
  var slideInAnimation: Animation {
    Animation.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)
      .speed(1)
      .delay(0.25)
  }

  // MARK: - Body
  var body: some View {
    ZStack {
      Image(header.image)
        .resizable()
        .scaledToFill()
      
      HStack(alignment: .top, spacing: 0) {
        Rectangle()
          .fill(Color("ColorBrownMedium"))
          .opacity(0.8)
          .frame(width: 4)
        
        VStack(alignment: .leading, spacing: 6) {
          Text(header.headline)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .shadow(radius: 3)
          
          Text(header.subheadline)
            .font(.footnote)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.white)
            .shadow(radius: 3)
        } //: VStack
        .padding(.vertical, 0)
        .padding(.horizontal, 20)
        .frame(width: 281, height: 105)
        .background(Color("ColorBlackTransparentLight"))
      } //: HStack
      .frame(width: 285, height: 105, alignment: .center)
      .offset(x: -66, y: showHeadline ? 80 : 190)
      .animation(slideInAnimation)
      .onAppear {
        showHeadline = true
      }
      .onDisappear {
        showHeadline = false
      }
    } //: ZStack
    .frame(width: 480, height: 320, alignment: .center)
  }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(header: headersData[1])
      .previewLayout(.sizeThatFits)
      .preferredColorScheme(.dark)
  }
}
