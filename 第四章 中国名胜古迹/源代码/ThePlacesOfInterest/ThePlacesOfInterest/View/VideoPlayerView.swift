//
//  VideoPlayerView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/13.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // MARK: - Properties
  var videoSelected: String
  var videoTitle: String
  
  
  // MARK: - Body
  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mov"))
        .overlay(
          Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width:32, height: 32)
            .padding(.top, 6)
            .padding(.horizontal, 8)
          , alignment: .topLeading
        )
    } //: VStack
    .accentColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
  }
}

// MARK: - Preview
struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "长江三峡", videoTitle: "长江三峡")
    }
  }
}
