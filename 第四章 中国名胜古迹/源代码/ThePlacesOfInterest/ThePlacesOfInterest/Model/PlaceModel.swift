//
//  PlaceModel.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/9.
//

import Foundation

struct Place: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let message: [String]
}
