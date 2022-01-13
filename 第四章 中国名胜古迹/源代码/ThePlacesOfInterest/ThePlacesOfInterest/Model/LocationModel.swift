//
//  LocationModel.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/14.
//

import Foundation
import MapKit

struct PlaceLocation: Codable, Identifiable {
  var id: String
  var name: String
  var image: String
  var latitude: Double
  var longitude: Double
  
  // 计算属性
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
