//
//  FoodCardView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/13.
//

import SwiftUI

struct FoodCardView: View {
  // MARK: - Properties
  var food: Food
  
  // MARK: - Body
  var body: some View {
    ZStack {
      Text(food.content)
        .padding(.leading, 55)
        .padding(.trailing, 10)
        .padding(.vertical, 3)
        .frame(width: 300, height: 135, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBrownMedium"), Color("ColorBrownLight")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(12)
        .lineLimit(6)
        .multilineTextAlignment(.leading)
        .font(.footnote)
        .foregroundColor(Color.white)
      
      Image(food.image)
        .resizable()
        .frame(width: 66, height: 66, alignment: .center)
        .clipShape(Circle())
        .background(
          Circle()
            .fill(Color.white)
            .frame(width: 74, height: 74, alignment: .center)
        )
        .background(
          Circle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorBrownMedium"), Color("ColorBrownLight")]), startPoint: .trailing, endPoint: .leading))
            .frame(width: 82, height: 82, alignment: .center)
        )
        .background(
          Circle()
            .fill(Color("ColorAppearanceAdaptive"))
            .frame(width: 90, height: 90, alignment: .center)
        )
        .offset(x: -150)
    }
  }
}

// MARK: - Preview
struct FoodCardView_Previews: PreviewProvider {
  static var previews: some View {
    FoodCardView(food: foodsData[3])
      //.preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 400, height: 220))
  }
}
