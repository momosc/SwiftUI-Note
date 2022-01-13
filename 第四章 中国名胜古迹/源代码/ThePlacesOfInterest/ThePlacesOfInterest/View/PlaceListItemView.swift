//
//  PlaceListItemView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/9.
//

import SwiftUI

struct PlaceListItemView: View {
  // MARK: - Properties
  let place: Place
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image(place.image)
        .resizable()
        .scaledToFill()
        .frame(width: 90, height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
      
      VStack(alignment: .leading, spacing: 8) {
        Text(place.image)
          .font(.title2)
          .fontWeight(.heavy)
          .foregroundColor(.accentColor)
        
        Text(place.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .padding(.trailing, 8)
      } //: VStack
    } //: HStack
  }
}

// MARK: - Preview
struct PlaceListItemView_Previews: PreviewProvider {
  static let places: [Place] = Bundle.main.decode("places.json")
  
  static var previews: some View {
    PlaceListItemView(place: places[1])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
