//
//  MotionAnimationView.swift
//  ThePlacesOfInterest
//
//  Created by 刘铭 on 2021/1/15.
//

import SwiftUI

struct MotionAnimationView: View {
  //MARK: - Properties
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var isAnimating = false
  
  // MARK: - Functions
  // 1. 随机坐标
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }
  
  // 2. 随机尺寸
  func randomSize() -> CGFloat {
    CGFloat(Int.random(in: 10...300))
  }
  
  // 3. 随机缩放比
  func randomScale() -> CGFloat {
    CGFloat(Double.random(in: 0.1...2.0))
  }
  
  // 4. 随机速度
  func randomSpeed() -> Double {
    Double.random(in: 0.025...1.0)
  }
  // 5. 随机延时
  func randomDelay() -> Double {
    Double.random(in: 0...2)
  }
  
  //MARK: - Body
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0 ..< randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(x: randomCoordinate(max: geometry.size.width),
                      y: randomCoordinate(max: geometry.size.height))
            .animation(
              Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            )
            .onAppear {
              isAnimating = true
            }
        } //: Loop
      } //: ZStack
      .drawingGroup()
    } //: Geometry
  }
}

//MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
      .previewDevice("iPhone 11 Pro")
  }
}
