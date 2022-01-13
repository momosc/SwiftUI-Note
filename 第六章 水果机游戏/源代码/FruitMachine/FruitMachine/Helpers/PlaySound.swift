//
//  PlaySound.swift
//  FruitMachine
//
//  Created by 刘铭 on 2021/3/19.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("错误：无法找到文件并播放该声效文件！")
    }
  }
}
