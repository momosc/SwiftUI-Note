//
//  HeaderModel.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/12.
//

import SwiftUI

// MARK: - HEADER MODEL
struct Header: Identifiable {
  var id = UUID()
  var image: String
  var headline: String
  var subheadline: String
}
