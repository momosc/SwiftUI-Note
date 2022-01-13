//
//  PlaySound.swift
//  FirstApp
//
//  Created by 刘铭 on 2021/1/31.
//

import Foundation
import AVFoundation

// MARK: - 音频播放器
var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("不能播放指定的音效文件。")
    }
  }  
}
