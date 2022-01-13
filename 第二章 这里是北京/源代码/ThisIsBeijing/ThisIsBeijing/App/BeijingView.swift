//
//  BeijingView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/10.
//

import SwiftUI

struct BeijingView: View {
  // MARK: - Properties
  @State private var pulsateAnimation: Bool = false
  
  // MARK: - Body
  var body: some View {
    VStack {
      Spacer()
      Image("Beijing-Logo")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 240, alignment: .center)
        .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
        .scaleEffect(pulsateAnimation ? 1.0 : 0.9)
        .opacity(pulsateAnimation ? 1.0 : 0.9)
        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
        
      VStack {
        Text("这里是北京")
          .font(.system(size: 42, weight: .bold, design: .serif))
          .foregroundColor(Color.white)
          .padding()
          .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
        Text("北京，是一座朴实亲切而又大气磅礴的城市既能海纳百川，又有着自己独特的风姿，既能独树一帜，又不孤芳自赏。")
          .lineLimit(nil)
          .font(.headline)
          .foregroundColor(Color("ColorBrown"))
          .multilineTextAlignment(.center)
          .lineSpacing(8)
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, minHeight: 120)
      } //: VStack
      .padding()
      
      Spacer()
    } //: VStack
    .background(
      Image("Background")
        .resizable()
        .scaledToFill()
    )
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      self.pulsateAnimation.toggle()
    }
  }
}

// MARK: - Preview
struct BeijingView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      BeijingView()
        .preferredColorScheme(.light)
      BeijingView()
        .preferredColorScheme(.dark)
    }
  }
}
