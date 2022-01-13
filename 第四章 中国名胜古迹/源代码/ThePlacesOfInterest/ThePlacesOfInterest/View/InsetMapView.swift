//
//  InsetMapView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/11.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - Properties
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.574565, longitude: 108.884720), span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
  
  // MARK: - Body
  var body: some View {
    Map(coordinateRegion: $region)
      .overlay(
        NavigationLink( destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            
            Text("所在位置")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
          } //: HStack
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
        }.padding(12)
        , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

// MARK: - Preview
struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
    InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
