//
//  VideoModel.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/12.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // 计算属性
  var thumbnail: String {
    get {
      return "视频封面-\(name)"
    }
  }
}
