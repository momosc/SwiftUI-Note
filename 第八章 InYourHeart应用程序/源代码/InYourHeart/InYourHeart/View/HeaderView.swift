//
//  HeaderView.swift
//  InYourHeart
//
//  Created by 刘铭 on 2021/4/15.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - Properties
  @Binding var showGuideView: Bool
  @Binding var showInfoView: Bool
  
  //MARK: - Body
  var body: some View {
    HStack {
      Button(action: {
        // 信息按钮的动作
        self.showInfoView.toggle()
      }, label: {
        Image(systemName: "info.circle")
          .font(.system(size: 24, weight: .regular))
      })
      .accentColor(.primary)
      .sheet(isPresented: $showInfoView) {
        InfoView()
      }
      
      Spacer()
      
      Image("logo-InYourHeart-Pink")
        .resizable()
        .scaledToFit()
        .frame(height: 38)
      
      Spacer()
      
      Button(action: {
        // 指南按钮的动作
        self.showGuideView.toggle()
      }, label: {
        Image(systemName: "questionmark.circle")
          .font(.system(size: 24, weight: .regular))
      })
      .accentColor(.primary)
      .sheet(isPresented: $showGuideView) {
        GuideView()
      }
    }
    .padding()
  }
}

//MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
  @State static var showGuideView = false
  @State static var showInfoView = false
  
  static var previews: some View {
    HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
