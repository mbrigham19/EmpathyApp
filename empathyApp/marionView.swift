//
//  marionView.swift
//  test
//
//  Created by Molly Brigham on 10/28/20.
//
import SwiftUI
import AVKit
 
 struct marionView: View {
     var body: some View {
         MarionPlayer().navigationTitle("Dr. Usselman")
     }
 }
 struct marionView_Previews: PreviewProvider {
     static var previews: some View {
         marionView()
     }
 }

 struct MarionPlayer : View {
     
     @State var data : Data = .init(count: 0)
     @State var title = ""
     @State var player : AVAudioPlayer! //allows audio to play
     @State var playing = false  //start off paused
     @State var width : CGFloat = 0
     @State var songs = ["marionAudio"] //audio of interview being played
     @State var current = 0
     @State var finish = false //interview not over
     @State var del = AVdelegate1()
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var btnBack : some View { Button(action: {
             self.presentationMode.wrappedValue.dismiss()
             }) {
                 HStack { //horizontal layout of the image
                    Image("marion")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white) //components of the image
                        Text("Go back")
                 }
             }
         }
     var body : some View { //title and description
         VStack(spacing: 20){
            Text("on the Distance Math Program")
                .font(.custom("Georgia", size: 30))
            Text("Dr. Marion Usselman of the Center for Education Integrating Science, Mathematics, and Computing (CEISMC) talks about the origins of the Distance Math Program at Georgia Tech and her role as a pioneer in its creation and evolution. ")
                .font(.custom("Georgia", size: 13))
                .foregroundColor(.secondary)
                .font(.caption)
             
             Image(uiImage: self.data.count == 0 ? UIImage(named: "marion")! : UIImage(data: self.data)!) //creates ui instance of the image we're using
             .resizable()
             .frame(width: self.data.count == 0 ? 150 : nil, height: 150)
             .cornerRadius(15)
             
             Text(self.title).font(.title).padding(.top)
             
             ZStack(alignment: .leading) { //create capsules
             
                 Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                 
                 Capsule().fill(Color.red).frame(width: self.width, height: 8)
                 .gesture(DragGesture()
                     .onChanged({ (value) in
                         
                         let x = value.location.x //x location of capsule
                         
                         self.width = x
                         
                     }).onEnded({ (value) in //when ends
                         
                         let x = value.location.x
                         
                         let screen = UIScreen.main.bounds.width - 30 //find coordinates to put capsules
                         
                         let percent = x / screen //calculating the current time in the audio to display
                         
                         self.player.currentTime = Double(percent) * self.player.duration
                     }))
             }
             .padding(.top) //padding
             
             HStack(spacing: UIScreen.main.bounds.width / 5 - 30){ //horizontal stack with audio controls and navigation
                 
                      NavigationLink(destination: marionView()) {
                         Image(systemName: "backward.fill").font(.title)
                        } //navigation backwards to previous interview
                 
                 
                     Button(action: { //this button goes back 15 seconds in the audio
                         
                         self.player.currentTime -= 15
                         
                     }) { //plus 15
                 
                         Image(systemName: "gobackward.15").font(.title)
                         
                     }
                 
                     Button(action: { //this button pauses and unpauses the audio
                         
                         if self.player.isPlaying{
                             
                             self.player.pause()
                             self.playing = false
                         }
                         else{
                             
                             if self.finish{
                                 
                                 self.player.currentTime = 0
                                 self.width = 0
                                 self.finish = false //not finished yet
                                 
                             }
                             
                             self.player.play()
                             self.playing = true //unpauses audio
                         }
                         
                     }) {
                 
                         Image(systemName: self.playing && !self.finish ? "pause.fill" : "play.fill").font(.title)
                         
                     } //play button if the audio is paused
                 
                     Button(action: { //this button increments the time by 15 seconds
                        
                         let increase = self.player.currentTime + 15
                         
                         if increase < self.player.duration{
                             
                             self.player.currentTime = increase //if there's still time left to increase
                         }
                         
                     }) {
                 
                         Image(systemName: "goforward.15").font(.title) //image for go forward
                         
                     }
                 NavigationLink(destination: georgiaView()) {
                     Image(systemName: "forward.fill").font(.title)
                 }
                 
             }.padding(.top,25)
             .foregroundColor(.black) //color specifics for arrows
             
         }.padding()
         .onAppear { //playing the audio
             
             let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
             //getting the url to play
             self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
             //play the contents of the audio url
             self.player.delegate = self.del
             //cast to self
             self.player.prepareToPlay()
             self.getData() //get information to play
             
             Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                 //updates the time on the screen while audio is playing
                 if self.player.isPlaying{
                     
                     let screen = UIScreen.main.bounds.width - 30
                     
                     let value = self.player.currentTime / self.player.duration
                     
                     self.width = screen * CGFloat(value)
                 }
             }
             
             NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                 //notification when finished
                 self.finish = true
             }
         }
         
     }
     
     
     func getData(){
         
         //get information from audio file
         let asset = AVAsset(url: self.player.url!)
         
         for i in asset.commonMetadata{
             
             if i.commonKey?.rawValue == "artwork"{
                 
                 let data = i.value as! Data
                 self.data = data
             }
             
             if i.commonKey?.rawValue == "title"{
                 
                 let title = i.value as! String
                 self.title = title
             }
         }
     }
     
 }

 class AVdelegate1 : NSObject,AVAudioPlayerDelegate{
     
     func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
         
         NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
     } //function for when the audio officially is done playing
    // notification that it's finished playing
 }
