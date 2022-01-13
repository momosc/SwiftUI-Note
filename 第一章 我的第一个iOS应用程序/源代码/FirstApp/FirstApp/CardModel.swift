//
//  CardModel.swift
//  FirstApp
//
//  Created by 刘铭 on 2021/1/31.
//

import SwiftUI

// MARK: - 卡片数据模型
struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
