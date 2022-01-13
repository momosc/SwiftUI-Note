//
//  ContentView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/8.
//

import SwiftUI

struct FoodView: View {
  // MARK: - Properties
  let headers: [Header] = headersData
  let foods: [Food] = foodsData
  let snackBars: [SnackBar] = snackBarsData
  
  // MARK: - Body 
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        // MARK: - Header
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 0) {
            ForEach(headers) { item in
              HeaderView(header: item)
            } //: Loop
          } //: HStack
        } //: ScrollView
        
        // Cooking Way
        Text("小吃的烹制方式")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        CookingWayView()
          .frame(maxWidth: 640)
        
        // MARK: - Beijing Foods
        Text("特色北京小吃")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(alignment: .top, spacing: 60) {
            ForEach(foods) { item in
              FoodCardView(food: item)
            }
          }
          .padding(.vertical)
          .padding(.leading, 60)
          .padding(.trailing, 20)
        }
        
        // MARK: - SnackBar CARD
        Text("特色小吃店")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        VStack(alignment: .center, spacing: 20) {
          ForEach(snackBars) { item in
            SnackBarCardView(snackBar: item)
          }
        }
        .frame(maxWidth: 640)
        .padding(.horizontal)
        
        // MARK: - Footer
        VStack(alignment: .center, spacing: 20) {
          Text("关于北京的小吃")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("ColorBrownAdaptive"))
            .padding(8)
          
          Text("北京小吃，历史悠久，技艺精湛，品种繁多。荟萃我国大江南北、长城内外的风味。愿《这里是北京》App能拓宽您的视野，丰富您的生活！")
            .font(.system(.body, design: .serif))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.gray)
            .frame(minHeight: 60)
        } //: VStack
        .frame(maxWidth: 640)
        .padding()
        .padding(.bottom, 85)
      } //: VStack
    } //: ScrollView
    .edgesIgnoringSafeArea(.all)
  }
}

// MARK: - TitleModifier
struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .serif))
      .foregroundColor(Color("ColorBrownAdaptive"))
      .padding(8)
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    FoodView()
      //.preferredColorScheme(.dark)
  }
}
