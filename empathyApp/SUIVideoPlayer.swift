//
//  SUIVideoPlayer.swift
//  empathyApp
//
//  Created by Molly Brigham on 3/22/21.
//

import SwiftUI
import AVKit

struct SUIVideoPlayer: View {
    private let player = AVPlayer(url: URL(string: "file:///Users/mollybrigham/Downloads/langston.mp4")!)
    //VideoPlayerContainerView(url: URL(string: "file:///Users/mollybrigham/Downloads/langston.mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                // Start the player going, otherwise controls don't appear
                player.play()
            }
            .onDisappear() {
                // Stop the player when the view disappears
                player.pause()
            }
    }
}

struct SUIVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        SUIVideoPlayer()
    }
}
