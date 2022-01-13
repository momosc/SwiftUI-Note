//
//  Shop.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/22.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingPen: Bool = false
  @Published var selectedPen: Pen? = nil
}
