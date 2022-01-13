//
//  HeaderTabView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/20.
//

import SwiftUI

struct HeaderTabView: View {
  // MARK: - Properties
  
  // MARK: - Body
  var body: some View {
    TabView {
      ForEach(headers) { item in
        HeaderItemView(header: item)
          .padding(.top, 10)
          .padding(.horizontal, 15)
      } //: Loop
    } //: TabView
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
}

// MARK: - Preview
struct HeaderTabView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderTabView()
      .background(Color.gray)
  }
}
