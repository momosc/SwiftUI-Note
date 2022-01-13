//
//  SnackBarRatingView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import SwiftUI

struct SnackBarRatingView: View {
  // MARK: - Properties
  let snackBar: SnackBar
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 5) {
      ForEach(1...(snackBar.rating), id: \.self) { _ in
        Image(systemName: "star.fill")
          .font(.body)
          .foregroundColor(Color.yellow)
      }
    }
  }
}

// MARK: - Preview
struct SnackBarRatingView_Previews: PreviewProvider {
  static var previews: some View {
    SnackBarRatingView(snackBar: snackBarsData[1])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
