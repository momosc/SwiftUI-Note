//
//  VegetableRowView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/25.
//

import SwiftUI

struct VegetableRowView: View {
  // MARK: - Properties
  var vegetable: Vegetable
  
  // MARK: - Body
  var body: some View {
    HStack {
      Image(vegetable.image)
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80, alignment: .center)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2 )
        .background(LinearGradient(gradient: Gradient(colors: vegetable.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 5) {
        Text(vegetable.title)
          .font(.title2)
          .fontWeight(.bold)
        Text(vegetable.headline)
          .font(.caption)
          .foregroundColor(.secondary)
      }
    }
  }
}


// MARK: - Preview
struct VegetableRowView_Previews: PreviewProvider {
  static var previews: some View {
    VegetableRowView(vegetable: vegetablesData[0])
      .preferredColorScheme(.light)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
