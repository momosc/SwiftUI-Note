//
//  VideoListView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/7.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - Properties
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.name, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        } //: Loop
      } //: List
      .listStyle(InsetGroupedListStyle())
      .navigationBarTitle("视频", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            videos.shuffle()
            hapticImpact.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    } //: NavigationView
  }
}

// MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
