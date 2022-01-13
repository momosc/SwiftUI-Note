//
//  ContentView.swift
//  FruitMachine
//
//  Created by 刘铭 on 2021/3/7.
//

import SwiftUI

struct ContentView: View {
  //MARK: - Properties
  @State private var showingInfoView: Bool = false
  
  @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
  @State private var coins: Int = 100
  @State private var coinsAmount: Int = 10
  @State private var isActive10 = true
  @State private var showingModal = false
  
  @State private var animatingSymbol = false
  @State private var animatingModal = false
  
  let haptics = UINotificationFeedbackGenerator()
  
  let symbols = ["草莓", "柠檬", "牛油果", "百香果", "葡萄"]
  @State private var reels: Array = [0, 1, 2]
  
  // MARK: - Functions
  // MARK: - 拉杆操作
  func spinReels() {
    reels = reels.map { _ in
      Int.random(in: 0...symbols.count - 1)
    }
    
    playSound(sound: "spin", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  // MARK: - 检测是否赢得一局游戏
  func checkWinning() {
    if reels[0] == reels[1] && reels[1] == reels[2] {
      // 赢得一局游戏
      playerWins()
      // 新的高分记录
      if coins > highScore {
        newHighScore()
      } else {
        playSound(sound: "win", type: "mp3")
      }
    } else {
      // 输掉一局游戏
      playerLoses()
    }
  }
  
  func playerWins() {
    coins += coinsAmount * 10
  }
  
  func newHighScore() {
    highScore = coins
    UserDefaults.standard.set(highScore, forKey: "HighScore")
    playSound(sound: "high-score", type: "mp3")
  }
  
  func playerLoses() {
    coins -= coinsAmount
  }
  
  func activate10() {
    coinsAmount = 10
    isActive10 = true
    playSound(sound: "change", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  func activate20() {
    coinsAmount = 20
    isActive10 = false
    playSound(sound: "change", type: "mp3")
    haptics.notificationOccurred(.success)
  }
  
  // 检测游戏是否结束
  func isGameOver() {
    if coins <= 0 {
      // 呈现弹出窗口
      showingModal = true
      playSound(sound: "game-over", type: "mp3")
    }
  }
  
  // 重置游戏最高分记录
  func resetGame() {
    UserDefaults.standard.set(0, forKey: "HighScore")
    highScore = 0
    coins = 100
    activate10()
    playSound(sound: "reset", type: "mp3")
  }
  
  //MARK: - Body
  var body: some View {
    ZStack {
      //MARK: - Background
      LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
      
      //MARK: - Interface
      VStack(alignment: .center, spacing: 5) {
        //MARK: - Header
        LogoView()
        Spacer()
        
        //MARK: - Score
        HStack {
          HStack {
            Text("你的\n分数")
              .scoreLableStyle()
              .multilineTextAlignment(.trailing)
              
            Text("\(coins)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
          } //: HStack
          .modifier(ScoreContainerModifier())
          
          Spacer()
          
          HStack {
            Text("\(highScore)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
            Text("最高\n分数")
              .scoreLableStyle()
              .multilineTextAlignment(.leading)
          } //: HStack
          .modifier(ScoreContainerModifier())
        } //: HStack
        
        //MARK: - FruitMachine
        VStack(alignment: .center, spacing: 0) {
          //MARK: - 槽位 #1
          ZStack {
            ReelView()
            Image(symbols[reels[0]])
              .resizable()
              .modifier(ImageModifier())
              .opacity(animatingSymbol ? 1 : 0)
              .offset(y: animatingSymbol ? 0 : -50)
              .animation(.easeOut(duration: Double.random(in: 0.5...0.7)))
              .onAppear{
                self.animatingSymbol.toggle()
              }
          } //: ZStack
          
          HStack(alignment: .center, spacing: 0) {
            //MARK: - 槽位 #2
            ZStack {
              ReelView()
              Image(symbols[reels[1]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.7...0.9)))
                .onAppear{
                  self.animatingSymbol.toggle()
                }
            } //: ZStack
            Spacer()
            //MARK: - 槽位3
            ZStack {
              ReelView()
              Image(symbols[reels[2]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.9...1.1)))
                .onAppear{
                  self.animatingSymbol.toggle()
                }
            } //: ZStack
          } //: HStack
          .frame(maxWidth: 500)
          
          //MARK: - 拉杆
          Button(action: {
            // 设置无动画状态
            withAnimation{
              self.animatingSymbol = false
            }
            
            // 拉杆操作
            self.spinReels()
            
            // 设置动画状态
            withAnimation{
              self.animatingSymbol = true
            }
            
            // 检测是否赢得一局
            self.checkWinning()
            
            // 检测游戏是否结束
            self.isGameOver()
          }, label: {
            Image("拉杆")
              .renderingMode(.original)
              .resizable()
              .modifier(ImageModifier())
          })
        } //: VStack
        .layoutPriority(2)
        
        //MARK: - Footer
        Spacer()
        
        HStack {
          //MARK: - 20分值
          HStack(alignment: .center, spacing: 10) {
            Button(action: {
              activate20()
            }) {
              Text("20")
                .fontWeight(.heavy)
                .foregroundColor(isActive10 == false ? Color("ColorYellow") : .white)
                .modifier(CoinNumberModifier())
            } //: Button
            .modifier(CoinCapsuleModifier())
            
            Image("钱币")
              .resizable()
              .opacity(isActive10 == false ? 1 : 0)
              .offset(x: isActive10 == false ? 0 : 20)
              .modifier(CoinImageModifier())
          } //: HStack
          
          Spacer()
          
          //MARK: - 10分值
          HStack(alignment: .center, spacing: 10) {
            Image("钱币")
              .resizable()
              .opacity(isActive10 == true ? 1 : 0)
              .offset(x: isActive10 == true ? 0 : -20)
              .modifier(CoinImageModifier())
            
            Button(action: {
              activate10()
            }) {
              Text("10")
                .fontWeight(.heavy)
                .foregroundColor(isActive10 == true ? Color("ColorYellow") : .white)
                .modifier(CoinNumberModifier())
            } //: Button
            .modifier(CoinCapsuleModifier())
          } //: HStack
        } //: HStack
      }
      // MARK: - 在浮动层添加按钮
      .overlay(
        // 重置按钮
        Button(action: {
          resetGame()
        }, label: {
          Image(systemName: "arrow.2.circlepath.circle")
        })
        .modifier(ButtonModifier())
        , alignment: .topLeading
      )
      .overlay(
        // 相关信息按钮
        Button(action: {
          //print("相关信息")
          self.showingInfoView = true
        }, label: {
          Image(systemName: "info.circle")
        })
        .modifier(ButtonModifier())
        , alignment: .topTrailing
      )
      .padding()
      .frame(maxWidth: 720)
      .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
      
      //MARK: - Popup
      if $showingModal.wrappedValue {
        ZStack {
          Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
          
          VStack(spacing: 0) {
            // 标题文本
            Text("游戏结束")
              .font(.title)
              .fontWeight(.heavy)
              .padding()
              .frame(minWidth:0, maxWidth: .infinity)
              .background(Color("ColorPink"))
              .foregroundColor(.white)
            
            Spacer()
            
            // 消息文本
            VStack(alignment: .center, spacing: 16) {
              Image("槽位-草莓")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 72)
              
              Text("很不幸！你失去了所有的分数。\n让我们再来一次吧！")
                .font(.body)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .layoutPriority(1)
              
              Button(action: {
                self.showingModal = false
                self.animatingModal = false
                self.activate10()
                self.coins = 100
              }, label: {
                Text("新游戏")
                  .font(.body)
                  .fontWeight(.semibold)
                  .accentColor(Color("ColorPink"))
                  .padding(.horizontal, 12)
                  .padding(.vertical, 8)
                  .frame(minWidth: 128)
                  .background(
                    Capsule()
                      .strokeBorder(lineWidth: 1.75)
                      .foregroundColor(Color("ColorPink"))
                  )
              })
            }
            
            Spacer()
            
          } //: VStack
          .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
          .background(Color.white)
          .cornerRadius(20)
          .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
          .opacity(animatingModal ? 1 : 0)
          .offset(y: animatingModal ? 0 : -100)
          .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
          .onAppear{
            self.animatingModal = true
          }
        } //: ZStack
      } //: IfEnd
    } //: ZStack
    .sheet(isPresented: $showingInfoView) {
      InfoView()
    }
  }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
