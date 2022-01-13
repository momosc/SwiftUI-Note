//
//  FooterView.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/15.
//

import SwiftUI

struct FooterView: View {
  // MARK: - Properties
  @Binding var showHeartAlert: Bool

  //MARK: - Body
  var body: some View {
    HStack {
      Image(systemName: "xmark.circle")
        .font(.system(size: 42, weight: .light))
      Spacer()
      Button(action: {
        self.showHeartAlert.toggle()
      }, label: {
        Text("心中的目的地")
          .font(.system(.subheadline, design: .rounded))
          .fontWeight(.heavy)
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .accentColor(Color.pink)
          .background(
            Capsule().stroke(Color.pink, lineWidth: 2)
          )
      })
      Spacer()
      Image(systemName: "heart.circle")
        .font(.system(size: 42, weight: .light))
    }
    .padding()
  }
}

//MARK: - Preview
struct FooterView_Previews: PreviewProvider {
  @State static var showAlert: Bool = false
  static var previews: some View {
    FooterView(showHeartAlert: $showAlert)
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
