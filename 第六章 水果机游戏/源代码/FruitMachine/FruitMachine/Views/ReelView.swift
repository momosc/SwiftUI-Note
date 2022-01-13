//
//  ReelView.swift
//  FruitMachine
//
//  Created by 刘铭 on 2021/3/11.
//

import SwiftUI

struct ReelView: View {
  //MARK: - Properties
  
  //MARK: - Body
  var body: some View {
    Image("槽位")
      .resizable()
      .modifier(ImageModifier())
  }
}

//MARK: - Preview
struct ReelView_Previews: PreviewProvider {
  static var previews: some View {
    ReelView()
      .previewLayout(.fixed(width: 220, height: 220))
  }
}
