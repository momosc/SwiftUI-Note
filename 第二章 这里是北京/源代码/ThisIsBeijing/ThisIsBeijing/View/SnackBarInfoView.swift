//
//  SnackBarInfoView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import SwiftUI

struct SnackBarInfoView: View {
  // MARK: - Properties
  let snackBar: SnackBar
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.3")
        Text("可用餐人数: \(snackBar.serves)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "clock")
        Text("备时: \(snackBar.preparation)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "flame")
        Text("热度: \(snackBar.hot)")
      }
    }
    .font(.footnote)
    .foregroundColor(Color.gray)
  }
}

// MARK: - Preview
struct SnackBarInfoView_Previews: PreviewProvider {
  static var previews: some View {
    SnackBarInfoView(snackBar: snackBarsData[0])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
