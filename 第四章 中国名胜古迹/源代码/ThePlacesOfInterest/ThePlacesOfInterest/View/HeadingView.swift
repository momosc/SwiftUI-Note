//
//  HeadingView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/10.
//

import SwiftUI

struct HeadingView: View {
  // MARK: - Properties
  var headingImage: String
  var headingText: String
  
  // MARK: - Body
  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    }
  }
}

// MARK: - Preview
struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "中国的名胜古迹")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
