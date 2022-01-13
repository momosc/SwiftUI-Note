//
//  QuantityFavouriteDetailView.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/22.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
  // MARK: - Properties
  @State private var counter:Int = 0
  
  // MARK: - Body
  var body: some View {
    HStack(alignment:.center, spacing: 6) {
      Button(action: {
        if counter > 0 {
          feedback.impactOccurred()
          counter -= 1
        }
      }, label: {
        Image(systemName: "minus.circle")
      })
      Text("\(counter)")
      Button(action: {
        if counter < 100 {
          feedback.impactOccurred()
          counter += 1
        }
      }, label: {
        Image(systemName: "plus.circle")
      })
      
      Spacer()
      Button(action: {
        feedback.impactOccurred()
      }, label: {
        Image(systemName: "heart.circle")
          .foregroundColor(.pink)
      })
    } //: HStack
    .font(.title)
    .foregroundColor(.black)
    .imageScale(.large)
  }
}

// MARK: - Preview
struct QuantityFavouriteDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavouriteDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
