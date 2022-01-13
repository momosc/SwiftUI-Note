//
//  ContentView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/3.
//

import SwiftUI

struct ContentView: View {
  //MARK: - Properties
  let places: [Place] = Bundle.main.decode("places.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn = 1
  @State private var toolbarIcon = "square.grid.2x2"
  
  @State private var isGridViewActive: Bool = false
  
  // MARK: - Function
  func gridSwitch() {
    gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumn = gridLayout.count
    
    // 按钮外观变换
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }
  
  //MARK: - Body
  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(places) { place in
              NavigationLink(destination: PlaceDetailView(place: place)) {
                PlaceListItemView(place: place)
              } //: Link
            } //: Loop
            CopyrightView()
              .modifier(CenterModifier())
          } //: List
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(places) { item in
                NavigationLink(
                  destination: PlaceDetailView(place: item)) {
                    PlaceGridItemView(place: item)
                  } //: Link
              } //: Loop
            } //: LazyVGrid
            .padding(10)
            .animation(.easeIn)
          } //: ScrollView
        } //: Endif
      } //: Group
      .navigationBarTitle("名胜古迹", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // 列表视图模式
            Button(action: {
              print("列表视图被激活")
              isGridViewActive = false
              haptics.impactOccurred()
            }){
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            } //: List Button
            
            // 网格视图模式
            Button(action: {
              print("网格视图被激活")
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }){
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            } //: Grid Button
          } //: HStack
        } //: ToolBarItem
      } //: Toolbar
    } //: NavigationView
  }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
