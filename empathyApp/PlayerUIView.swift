//
//  PlayerUIView.swift
//  test
//
//  Created by Molly Brigham on 11/23/20.
//
import SwiftUI
import AVKit
import AVFoundation
import UIKit

class PlayerUIView: UIView {
  private let playerLayer = AVPlayerLayer()

  override init(frame: CGRect) {

    super.init(frame: frame)
    
    let url = URL(string: "file:///Users/mollybrigham/Downloads/langston.mp4")!
    let player = AVPlayer(url: url)
    player.play()
    
    playerLayer.player = player
    layer.addSublayer(playerLayer)
  }

  required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
