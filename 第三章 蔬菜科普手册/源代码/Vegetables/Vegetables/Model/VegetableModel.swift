//
//  VegetableModel.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/22.
//

import Foundation
import SwiftUI

// MARK: - Vegetables Data Model
struct Vegetable: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [Color]
  var description: String
  var classification: [String]
}
