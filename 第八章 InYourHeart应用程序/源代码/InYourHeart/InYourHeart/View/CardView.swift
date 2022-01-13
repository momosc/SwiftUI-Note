//
//  CardView.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/15.
//

import SwiftUI

struct CardView: View, Identifiable {
  //MARK: - Properties
  let id = UUID()
  var photo: Destination
  
  //MARK: - Body
  var body: some View {
    Image(photo.image)
      .resizable()
      .cornerRadius(24)
      .scaledToFit()
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(
        VStack(alignment: .center, spacing: 12, content: {
          Text(photo.place)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.vertical, 4)
            .overlay(
              Rectangle().fill(Color.white).frame(height: 1),
              alignment: .bottom
            )
          Text(photo.country)
            .foregroundColor(.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Capsule().fill(Color.white))
        })
        .frame(minWidth: 280)
        .padding(.bottom, 50),
        alignment: .bottom
      )
    
  }
}

//MARK: - Preview
struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(photo: inYourHeartData[0])
      .previewLayout(.fixed(width: 375, height: 600))
  }
}
