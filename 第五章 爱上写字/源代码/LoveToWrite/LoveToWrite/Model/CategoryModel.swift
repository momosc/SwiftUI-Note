//
//  CategoryModel.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/20.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  var image: String {
    self.name
  }
}
