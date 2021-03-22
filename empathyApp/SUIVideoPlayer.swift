//
//  SUIVideoPlayer.swift
//  empathyApp
//
//  Created by Molly Brigham on 3/22/21.
//

import SwiftUI
import AVKit

struct SUIVideoPlayer: View {
    //mp4 file being accessed by avplayer
    private let player = AVPlayer(url: URL(string: "file:///Users/mollybrigham/Downloads/langston.mp4")!)
    
    var body: some View {
        VideoPlayer(player: player)
            //start to play when entering georgiaView
            .onAppear() {
                
                player.play()
            }
            .onDisappear() {
                //stop playing when exiting georgiaView
                player.pause()
            }
    }
}

struct SUIVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        SUIVideoPlayer()
    }
}
