//
//  SnackBarDetailView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import SwiftUI

struct SnackBarDetailView: View {
  // MARK: - Properties
  let snackBar: SnackBar
  
  @State private var pulsate: Bool = false
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment:.center, spacing: 0) {
        Image(snackBar.image)
          .resizable()
          .scaledToFit()
        
        Group {
          // 标题
          Text(snackBar.title)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("ColorBrownAdaptive"))
            .padding(.top, 10)
          
          // 评星
          SnackBarRatingView(snackBar: snackBar)
          
          // 服务信息
          SnackBarInfoView(snackBar: snackBar)
          
          // 美食介绍
          Text("美 食 介 绍")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          
          VStack(alignment: .leading, spacing: 5) {
            ForEach(snackBar.introduction, id: \.self) { item in
              VStack(alignment: .leading, spacing: 5) {
                Text(item)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                Divider()
              } //: VStack
            } //: Loop
          } //: VStack
          
          // 制作方法
          Text("制 作 方 法")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          
          ForEach(snackBar.method, id: \.self) { item in
            VStack(alignment: .center, spacing: 5) {
              Image(systemName: "chevron.down.circle")
                .resizable()
                .frame(width: 42, height: 42, alignment: .center)
                .imageScale(.large)
                .font(Font.title.weight(.ultraLight))
                .foregroundColor(Color("ColorBrownAdaptive"))
              
              Text(item)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .font(.system(.body, design: .serif))
                .frame(minHeight: 100)
            } //: VStack
          } //: Loop
        } //: Group
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
      } //: VStack
    } //: ScrollView
    .edgesIgnoringSafeArea(.all)
    .overlay(
      HStack {
        Spacer()
        VStack {
          Button(action: {
            // ACTION
            self.presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "chevron.down.circle.fill")
              .font(.title)
              .foregroundColor(Color.white)
              .shadow(radius: 4)
              .opacity(self.pulsate ? 1 : 0.6)
              .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
              .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
          })
            .padding(.trailing, 20)
            .padding(.top, 24)
          Spacer()
        }
      }
    )
    .onAppear() {
      self.pulsate.toggle()
    }
  }
}

struct SnackBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    SnackBarDetailView(snackBar: snackBarsData[1])
  }
}
