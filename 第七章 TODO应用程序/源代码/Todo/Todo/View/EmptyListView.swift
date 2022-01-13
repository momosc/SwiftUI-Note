//
//  EmptyListView.swift
//  Todo
//
//  Created by 刘铭 on 2021/3/30.
//

import SwiftUI

struct EmptyListView: View {
  //MARK: - Properties
  @State private var isAnimated = false
  
  let images: [String] = [
    "illustration-1",
    "illustration-2",
    "illustration-3",
    "illustration-4",
    "illustration-5",
  ]
  
  let tips: [String] = [
    "更好地利用你的时间",
    "放慢你的工作节奏，效果更佳",
    "始终保持你的甜美和简捷",
    "努力工作是第一要务",
    "适当的放纵对自身更健康",
    "吾日三省吾身"
  ]
  
  // Theme
  @ObservedObject var theme = ThemeSettings.shared
  var themes: [Theme] = themeData
  
  //MARK: - Body
  var body: some View {
    ZStack {
      VStack(alignment: .center, spacing: 20) {
        Image("\(images.randomElement() ?? images[0])")
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
          .layoutPriority(1)
          .foregroundColor(themes[theme.themeSettings].themeColor)
        
        Text("\(tips.randomElement() ?? tips[0])")
          .layoutPriority(0.5)
          .font(.headline)
          .foregroundColor(themes[theme.themeSettings].themeColor)
      } //: VStack
      .padding(.horizontal)
      .opacity(isAnimated ? 1 : 0)
      .offset(y: isAnimated ? 0 : -50)
      .animation(Animation.easeIn(duration: 1.5), value: isAnimated)
      .onAppear{
        isAnimated.toggle()
      }
    } //: ZStack
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color("ColorBase"))
    .edgesIgnoringSafeArea(.all)
  }
}

//MARK: - Preview
struct EmptyListView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyListView()
  }
}
