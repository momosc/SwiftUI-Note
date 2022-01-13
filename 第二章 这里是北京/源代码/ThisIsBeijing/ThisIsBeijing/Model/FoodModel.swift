//
//  FoodModel.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/13.
//

import SwiftUI

// MARK: - Food MODEL
struct Food: Identifiable {
  var id = UUID()
  var image: String
  var content: String
}
