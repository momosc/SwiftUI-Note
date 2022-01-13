//
//  PlaceGridItemView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/18.
//

import SwiftUI

struct PlaceGridItemView: View {
  // MARK: - Properties
  let place: Place
  
  // MARK: - Body
  var body: some View {
    Image(place.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: - Preview
struct PlaceGridItemView_Previews: PreviewProvider {
  static let places: [Place] = Bundle.main.decode("places.json")
  static var previews: some View {
    PlaceGridItemView(place: places[2])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
