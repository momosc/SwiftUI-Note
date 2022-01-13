//
//  CardView.swift
//  FirstApp
//
//  Created by 刘铭 on 2021/1/30.
//

import SwiftUI

struct CardView: View {
  // MARK: - Properties
  var card: Card
  
  @State private var fadeIn: Bool = false
  @State private var moveDownward: Bool = false
  @State private var moveUpward: Bool = false
  @State private var showAlert: Bool = false
  
  var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
  
  // MARK: - Body
  var body: some View {
    ZStack {
      Image(card.imageName)
        .opacity(fadeIn ? 1.0 : 0.0)
      
      VStack {
        Text(card.title)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
        Text(card.headline)
          .fontWeight(.light)
          .foregroundColor(.white)
          .italic()
      }
      .offset(y: moveDownward ? -218 : -300)
      
      Button(action: {
        print("按钮被用户点击")
        playSound(sound: "sound-transitions", type: "mp3")
        hapticImpact.impactOccurred()
        self.showAlert.toggle()
      }){
        HStack {
          Text(card.callToAction)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .accentColor(.white)
          Image(systemName: "arrow.right.circle")
            .font(Font.title.weight(.medium))
            .accentColor(.white)
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
      }
      .offset(y: moveUpward ? 210 : 300) 
    }
    .frame(width: 335, height: 545)
    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(16)
    .shadow(radius: 8)
    .onAppear() {
      withAnimation(.linear(duration: 1.2)) {
        self.fadeIn.toggle()
      }
      withAnimation(.linear(duration: 0.8)) {
        self.moveDownward.toggle()
        self.moveUpward.toggle()
      }
    }
    .alert(isPresented: $showAlert){
      Alert(title: Text(card.title),
            message: Text(card.message),
            dismissButton: .default(Text("OK"))
      )
    }
  }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: cardData[5])
      .previewLayout(.sizeThatFits)
  }
}
