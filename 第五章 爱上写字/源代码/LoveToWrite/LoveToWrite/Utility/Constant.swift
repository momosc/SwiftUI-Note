//
//  Constant.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/19.
//

import Foundation
import SwiftUI

// Data
let headers: [Header] = Bundle.main.decode("header.json")
let categories: [Category] = Bundle.main.decode("category.json")
let pens: [Pen] = Bundle.main.decode("pen.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let samplePen: Pen = pens[0]
// Color
let colorBackground = Color("ColorBackground")
let colorGray = Color(UIColor.systemGray4)

// Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// UX
let feedback = UIImpactFeedbackGenerator(style: .medium)

// API
// Image
// Font
// String
// Misc

