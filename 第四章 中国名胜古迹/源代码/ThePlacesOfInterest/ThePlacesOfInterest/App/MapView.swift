//
//  MapView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/7.
//

import SwiftUI
import MapKit

struct MapView: View {
  //MARK: - Properties
  @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 30.555624612131368, longitude: 114.30381222526006)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 25.0, longitudeDelta: 25.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    
    return mapRegion
  }()
  
  let locations: [PlaceLocation] = Bundle.main.decode("locations.json")
  
  //MARK: - Body
  var body: some View {
    //MARK: - 1. 基本地图
    //Map(coordinateRegion: $region)
    
    //MARK: - 2. 高级地图
    Map(coordinateRegion: $region, annotationItems: locations) { item in
      // 方案1. Pin：老旧的风格
      // MapPin(coordinate: item.location, tint: .accentColor)
      // 方案2. Marker：崭新的风格
      //MapMarker(coordinate: item.location, tint: .accentColor)
      
      // 方案3. 自定义基本标注（用户可以点击交互）
      /*
      MapAnnotation(coordinate: item.location) {
        Image("Logo")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20, alignment: .center)
      }*/
      
      // 方案4. 自定义高级标注
      MapAnnotation(coordinate: item.location) {
        MapAnnotationView(location: item)
      }
    }
    .overlay(
      HStack(alignment: .center, spacing: 12) {
        Image("Logo")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)
        
        VStack(alignment: .leading, spacing: 3) {
          HStack {
            Text("经度：")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.latitude)")
              .font(.footnote)
              .foregroundColor(.white)
          } //: HStack
          Divider()
          HStack {
            Text("纬度：")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            Spacer()
            Text("\(region.center.longitude)")
              .font(.footnote)
              .foregroundColor(.white)
          } //: HStack
        } //: VStack
      } //: HStack
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(
        Color.black
          .cornerRadius(8)
          .opacity(0.6)
      ).padding()
      , alignment: .top
    )
  }
}

//MARK: - Preview
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
