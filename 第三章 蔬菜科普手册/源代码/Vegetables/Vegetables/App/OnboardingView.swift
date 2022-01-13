//
//  OnboardingView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/21.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - Properties
  var vegetables: [Vegetable]
  
  // MARK: - Body
  var body: some View {
    TabView {
      ForEach(vegetables[0 ..< 5]) { item in
        VegetableCardView(vegetable: item)
      } //: Loop
    } //: TabView
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
  }
}

// MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(vegetables: vegetablesData)
  }
}
