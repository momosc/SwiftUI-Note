//
//  SnackBarModel.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import SwiftUI

// MARK: - Snack Bar MODEL

struct SnackBar: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var rating: Int
  var serves: Int
  var preparation: Int
  var hot: Int
  var introduction: [String]
  var method: [String]
}
