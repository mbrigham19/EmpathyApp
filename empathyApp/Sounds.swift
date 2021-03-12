//
//  Sounds.swift
//  test
//
//  Created by Molly Brigham on 10/30/20.
//
import Foundation
import AVFoundation

 class Sounds {

   static var audioPlayer:AVAudioPlayer?

   static func playSounds(soundfile: String) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

           do{

               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayer?.prepareToPlay()
               audioPlayer?.play()

           }catch {
               print("Error")
           }
       }
    }
 }
