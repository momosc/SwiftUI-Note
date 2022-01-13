//
//  VegetableDetailView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/26.
//

import SwiftUI

struct VegetableDetailView: View {
  // MARK: - Properties
  var vegetable: Vegetable
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // Header
          VegetableHeaderView(vegetable: vegetable)
          
          VStack(alignment: .leading, spacing: 20) {
            // 标题
            Text(vegetable.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundColor(vegetable.gradientColors[1])
            
            // 提要
            Text(vegetable.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)
            
            // 分类
            VegetableClassificationView(vegetable: vegetable)
            
            // 子提要
            Text("了解更多关于：\(vegetable.title)")
              .fontWeight(.bold)
              .foregroundColor(vegetable.gradientColors[1])
            
            // 描述
            Text(vegetable.description)
              .multilineTextAlignment(.leading)
            
            // 链接
            SourceLinkView()
              .padding(.top, 10)
              .padding(.bottom, 40)
            
          } //: VStack
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        } //: VStack
        .navigationBarTitle(vegetable.title, displayMode: .inline)
        .navigationBarHidden(true)
      } //: ScrollView
      .edgesIgnoringSafeArea(.top)
    } //: NavigationView
  }
}


// MARK: - Preview
struct VegetableDetailView_Previews: PreviewProvider {
  static var previews: some View {
    VegetableDetailView(vegetable: vegetablesData[0])
  }
}
