//
//  HutongModel.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import Foundation

// MARK: Hutong MODEL
struct Hutong: Identifiable {
  var id = UUID()
  var image: String
  var title: String
  var ranking: String
  var description: String
  var times: String
  var feature: String
}
