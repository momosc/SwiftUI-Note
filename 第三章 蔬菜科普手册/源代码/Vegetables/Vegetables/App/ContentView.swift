//
//  ContentView.swift
//  Vegetables
//
//  Created by 刘铭 on 2020/12/18.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  var vegetables: [Vegetable] = vegetablesData
  
  @State private var isShowingSettings: Bool = false
  
  // MARK: - Body
  var body: some View {
    NavigationView {
      List {
        ForEach(vegetables.shuffled()) { item in
          NavigationLink(destination: VegetableDetailView(vegetable: item)){
            VegetableRowView(vegetable: item)
              .padding(.vertical, 4)            
          }
        }
      }
      .navigationTitle("蔬菜")
      .navigationBarItems(trailing:
                            Button(action: {
                              isShowingSettings = true
                            }) {
                              Image(systemName: "slider.horizontal.3")
                            }
        .sheet(isPresented: $isShowingSettings) {
          SettingsView()
        }
      )
    }
  }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
