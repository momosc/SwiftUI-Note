//
//  FormRowStaticView.swift
//  Todo
//
//  Created by 刘铭 on 2021/4/1.
//

import SwiftUI

struct FormRowStaticView: View {
  //MARK: - Properties
  var icon: String
  var firstText: String
  var secondText: String
  
  //MARK: - Body
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(Color.gray)
        Image(systemName: icon)
          .foregroundColor(.white)
      } //: ZStack
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(firstText).foregroundColor(.gray)
      Spacer()
      Text(secondText)
    } //: HStack
  }
}

//MARK: - Preview
struct FormRowStaticView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowStaticView(
      icon: "gear",
      firstText: "应用程序",
      secondText: "待办事项"
    )
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
