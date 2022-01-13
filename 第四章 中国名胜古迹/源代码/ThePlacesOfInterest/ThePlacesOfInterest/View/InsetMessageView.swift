//
//  InsetMessageView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/10.
//

import SwiftUI

struct InsetMessageView: View {
  // MARK: - Properties
  let place: Place
  
  // MARK: - Body
  var body: some View {
    GroupBox {
      TabView {
        ForEach(place.message, id: \.self) { item in
          Text(item)
        } //: Loop
      } //: TabView
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    } //: GroupBox
  }
}

// MARK: - Preview
struct InsetMessageView_Previews: PreviewProvider {
  static let places: [Place] = Bundle.main.decode("places.json")
  static var previews: some View {
    InsetMessageView(place: places[7])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
