//
//  SettingsRowView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/28.
//

import SwiftUI

struct SettingsRowView: View {
  // MARK: - Properties
  var name: String
  var content: String?
  var linkLabel: String?
  var linkDestination: String?
  
  // MARK: - Body
  var body: some View {
    VStack {
      Divider().padding(.vertical, 4)
      HStack {
        Text(name).foregroundColor(.gray)
        Spacer()
        if (content != nil) {
          Text(content!)
        }else if (linkLabel != nil && linkDestination != nil) {
          Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
          Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
        }else {
          EmptyView()
        }
      }
    }
  }
}

// MARK: - Preview
struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      SettingsRowView(name: "开发人员", content: "liumingl / happy")
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
      SettingsRowView(name: "网站", linkLabel: "百度", linkDestination: "www.baidu.com")
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
    }
  }
}
