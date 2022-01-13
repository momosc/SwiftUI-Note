//
//  SnackBarCardView.swift
//  ThisIsBeijing
//
//  Created by 刘铭 on 2021/2/14.
//

import SwiftUI

struct SnackBarCardView: View {
  // MARK: - Properties
  let snackBar: SnackBar
  let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
  
  @State private var showModal: Bool = false
  
  // MARK: - Body
  var body: some View {
    VStack(alignment:.leading, spacing: 0) {
      Image(snackBar.image)
        .resizable()
        .scaledToFit()
        .overlay(
          HStack {
            Spacer()
            VStack {
              Image(systemName: "bookmark")
                .font(Font.title.weight(.light))
                .foregroundColor(Color.white)
                .imageScale(.small)
                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                .padding(.trailing, 20)
                .padding(.top, 22)
              Spacer()
            }
          }
      )
      
      VStack(alignment:.leading, spacing: 12) {
        // Title
        Text(snackBar.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorBrownMedium"))
          .lineLimit(1)
        
        // Headline
        Text(snackBar.headline)
          .font(.system(.body, design: .serif))
          .foregroundColor(Color.gray)
        
        // Rating
        SnackBarRatingView(snackBar: snackBar)
        
        // Info
        SnackBarInfoView(snackBar: snackBar)
        
      } //: VStack
      .padding()
      .padding(.bottom, 12)
    } //: VStack
    .background(Color.white)
    .cornerRadius(12)
    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
    .onTapGesture {
      self.hapticImpact.impactOccurred()
      self.showModal = true
    }
    .sheet(isPresented: $showModal) {
      SnackBarDetailView(snackBar: self.snackBar)
    }
  }
}

// MARK: - Preview
struct SnackBarCardView_Previews: PreviewProvider {
  static var previews: some View {
    SnackBarCardView(snackBar: snackBarsData[7])
      .previewLayout(.sizeThatFits)
  }
}
