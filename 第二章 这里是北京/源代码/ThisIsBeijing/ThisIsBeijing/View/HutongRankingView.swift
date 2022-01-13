//
//  HutongRankingView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import SwiftUI

struct HutongRankingView: View {
  //MARK: - Properties
  let hutong: Hutong
  
  @State private var slideInAnimation: Bool = false
  
  //MARK: - Body
  var body: some View {
    VStack {
      Image(hutong.image)
        .resizable()
        .frame(width: 100, height: 100, alignment: .center)
        .clipShape(Circle())
        .background(
          Circle()
            .fill(Color("ColorBrownLight"))
            .frame(width: 110, height: 110, alignment: .center)
        )
        .background(
          Circle()
            .fill(Color("ColorAppearanceAdaptive"))
            .frame(width: 120, height: 120, alignment: .center)
        )
        .zIndex(1)
        .animation(Animation.easeInOut(duration: 1))
        .offset(y: slideInAnimation ? 55 : -55)
      
      VStack(alignment: .center, spacing: 10) {
        VStack(alignment: .center, spacing: 0) {
          Text(hutong.ranking)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
          
          Text("评星")
            .font(.system(.body, design: .serif))
            .fontWeight(.heavy)
        }
        .foregroundColor(Color("ColorBrownMedium"))
        .padding(.top, 65)
        .frame(width: 180)
        
        // 胡同标题
        Text(hutong.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorBrownMedium"))
          .padding(.vertical, 12)
          .padding(.horizontal, 0)
          .frame(width: 220)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color("ColorBrownLight")]), startPoint: .top, endPoint: .bottom))
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
          )
        
        // 描述
        Spacer()
        Text(hutong.description)
          .foregroundColor(Color.white)
          .fontWeight(.bold)
          .lineLimit(nil)
        Spacer()
        
        // 游览时长
        Text(hutong.times)
          .foregroundColor(Color.white)
          .font(.system(.callout, design: .serif))
          .fontWeight(.bold)
          .shadow(radius: 3)
          .padding(.vertical)
          .padding(.horizontal, 0)
          .frame(width: 185)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorBrownMedium"), Color("ColorBrownDark")]), startPoint: .top, endPoint: .bottom))
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
          )
        
        // 特点
        Text(hutong.feature)
          .font(.footnote)
          .foregroundColor(Color("ColorBrownLight"))
          .fontWeight(.bold)
          .lineLimit(3)
          .frame(width: 160)
        Spacer()
      }
      .zIndex(0)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
      .frame(width: 260, height: 485, alignment: .center)
      .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBrownLight"), Color("ColorBrownMedium")]), startPoint: .top, endPoint: .bottom))
      .cornerRadius(20)
    } //: VStack
    .onAppear {
      slideInAnimation.toggle()
    }
  }
}

//MARK: - Preview
struct HutongRankingView_Previews: PreviewProvider {
  static var previews: some View {
    HutongRankingView(hutong: hutongsData[1])
  }
}
