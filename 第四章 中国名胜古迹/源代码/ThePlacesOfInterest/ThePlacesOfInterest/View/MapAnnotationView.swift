//
//  MapAnnotationView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/14.
//

import SwiftUI

struct MapAnnotationView: View {
  //MARK: - Properties
  var location: PlaceLocation
  @State private var animation: Double = 0.0
  
  //MARK: - Body
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .scaleEffect(1 + CGFloat(animation))
        .opacity(1 - animation)
      
      
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    } //: ZStack
    .onAppear {
      withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
        animation = 1
      }
    }
  }
}

//MARK: - Preview
struct MapAnnotationView_Previews: PreviewProvider {
  static let locations: [PlaceLocation] = Bundle.main.decode("locations.json")
  static var previews: some View {
    MapAnnotationView(location: locations[2])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
