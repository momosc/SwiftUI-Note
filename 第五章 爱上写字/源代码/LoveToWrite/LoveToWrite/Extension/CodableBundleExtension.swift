//
//  CodableBundleExtension.swift
//  LoveToWrite
//
//  Created by 刘铭 on 2021/2/20.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // 1. 载入本地json文件
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("载入本地文件 \(file) 失败！")
    }
    
    // 2. 为数据创建一个属性
    guard let data = try? Data(contentsOf: url) else {
      fatalError("从Bundle读取 \(file) 中的数据失败！")
    }
    
    // 3. 创建decode
    let decode = JSONDecoder()
    
    // 4. 为解码数据创建一个属性
    guard let loaded = try? decode.decode(T.self, from: data) else {
      fatalError("从Bundle中解析 \(file) 文件的数据失败！")
    }
    
    // 5. 返回只读属性的数据
    return loaded
  }
}
