//
//  FooterView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/19.
//

import SwiftUI

struct FooterView: View {
  // MARK: - Properties
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      Text("练字是一种慢功，得勤学苦练，天长日久方能见功夫。是没有捷径可以走的！练字是思维活动和对感觉器官的一种锻炼，是眼、脑、手并用形成的一种特殊技巧。")
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(2)
      
      Image("Logo")
        .renderingMode(.template)
        .foregroundColor(.gray)
        .layoutPriority(0)
      
      Text("Copyright © Happy Liu\nAll right reserved")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(1)
    } //: VStack
    .padding()
  }
}

// MARK: - Preview
struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
    FooterView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
