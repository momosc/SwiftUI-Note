//
//  HutongView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/10.
//

import SwiftUI

struct HutongView: View {
  // MARK: - Properties
  let hutongs: [Hutong] = hutongsData
  
  // MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack {
        Spacer()
        HStack(alignment: .center, spacing: 25) {
          ForEach(hutongs) { item in
            HutongRankingView(hutong: item)
          } //: Loop
        } //: HStack
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer()
      } //: VStack
    } //: ScrollView
    .edgesIgnoringSafeArea(.all)
  }
}

// MARK: - Preview
struct HutongView_Previews: PreviewProvider {
  static var previews: some View {
    HutongView()
  }
}
