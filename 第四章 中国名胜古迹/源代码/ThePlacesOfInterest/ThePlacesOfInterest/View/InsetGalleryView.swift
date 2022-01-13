//
//  InsetGalleryView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/10.
//

import SwiftUI

struct InsetGalleryView: View {
  // MARK: - Properties
  let place: Place
  
  
  // MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing:15) {
        ForEach(place.gallery, id:\.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(12)
        } //: Loop
      } //: HStack
    } //: ScrollView
  }
}

// MARK: - Preview
struct InsetGalleryView_Previews: PreviewProvider {
  static let places: [Place] = Bundle.main.decode("places.json")
  static var previews: some View {
    InsetGalleryView(place: places[5])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
