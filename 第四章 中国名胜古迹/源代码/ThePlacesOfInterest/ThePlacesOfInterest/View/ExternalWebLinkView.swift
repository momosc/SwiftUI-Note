//
//  ExternalWebLinkView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/11.
//

import SwiftUI

struct ExternalWebLinkView: View {
  // MARK: - Properties
  let place: Place
  
  // MARK: - Body
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("百度百科")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          
          Link(place.name, destination: (URL(string: place.link) ?? URL(string: "https://baike.baidu.com/"))!)
        } //: Group
        .foregroundColor(.accentColor)
      } //: HStack
    } //: GroupBox
  }
}

// MARK: - Preview
struct ExternalWebLinkView_Previews: PreviewProvider {
  static let places: [Place] = Bundle.main.decode("places.json")
  static var previews: some View {
    ExternalWebLinkView(place: places[6])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
