//
//  VegetableClassificationView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/26.
//

import SwiftUI

struct VegetableClassificationView: View {
  // MARK: - Properties
  var vegetable: Vegetable
  
  let classification: [String] = ["门", "纲", "亚纲", "目", "科", "属", "族", "种", "分布区域"]
  
  // MARK: - Body
  var body: some View {
    GroupBox {
      DisclosureGroup("蔬菜分类") {
        ForEach(0..<classification.count, id: \.self) { item in
          Divider().padding(.vertical, 2)
          HStack {
            HStack {
              Image(systemName: "info.circle")
              Text(classification[item])
            }
            .foregroundColor(vegetable.gradientColors[1])
            .font(Font.system(.body).bold())
            
            Spacer(minLength: 65)
            
            Text(vegetable.classification[item])
              .multilineTextAlignment(.trailing)
          } //: HStack
        } //: ForEach
      } //: DisclosureGroup
    } //: GroupBox
  }
}

// MARK: - Preview
struct VegetableClassificationView_Previews: PreviewProvider {
  static var previews: some View {
    VegetableClassificationView(vegetable: vegetablesData[0])
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 375, height: 480))
      .padding()
  }
}
