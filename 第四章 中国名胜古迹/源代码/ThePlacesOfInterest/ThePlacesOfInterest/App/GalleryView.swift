//
//  GalleryView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/7.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - Properties
  let places: [Place] = Bundle.main.decode("places.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var selectedPlace: String = "万里长城"
  
  // MARK: - 简单的网格定义
//  let gridLayout: [GridItem] = [
//    GridItem(.flexible()),
//    GridItem(.flexible()),
//    GridItem(.flexible())
//  ]
  // 利用数组方法定义网格元素
  // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
    
  // MARK: - Body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        // MARK: - Image
        Image(selectedPlace)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(
            Circle().stroke(Color.white, lineWidth: 8)
          )
        
        // MARK: - Slider
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn){ value in
            gridSwitch()
          }
        
        // MARK: - 网格视图
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(places) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedPlace = item.image
                haptics.impactOccurred()
              }
          } //: Loop
        } //: Grid
        .onAppear{
          gridSwitch()
        }
        .animation(.easeIn)
      } //: VStack
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    } //: Scroll
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
