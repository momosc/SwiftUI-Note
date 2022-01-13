//
//  SettingsLabelView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/28.
//

import SwiftUI

struct SettingsLabelView: View {
  // MARK: - Properties
  var labelText: String
  var labelImage: String
  
  // MARK: - Body
  var body: some View {
    HStack {
      Text(labelText)
      Spacer()
      Image(systemName: labelImage)
    }
  }
}

// MARK: - Preview
struct SettingsLabelView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "蔬菜百科", labelImage: "info.circle")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
