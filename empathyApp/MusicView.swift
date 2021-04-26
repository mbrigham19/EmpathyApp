//
//  MusicView.swift
//  test
//
//  Created by Molly Brigham on 2/23/21.
//

import SwiftUI
import AVKit

struct MusicView: View {
    var body: some View {
        MusicPlayer().navigationTitle("Matthew Dick") //title for the navigation bar when you enter this view

       
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView() //displays the music view screen
    }
}

struct MusicPlayer : View {
    
    @State var data : Data = .init(count: 0) //initial data set
    @State var title = ""
    @State var player : AVAudioPlayer! //sound player
    @State var playing = false //not currently playing
    @State var width : CGFloat = 0 //width of screen
    @State var songs = ["dickAudio"] //song being played
    @State var current = 0 //starts at init
    @State var finish = false //not done playing
    @State var del = AVdelegate() //sets delegate to audio visual
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: { //back button
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("matthew") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white) //other qualities of image
                    Text("Go back")
                }
            }
        }
    var body : some View{ //enter new view
        
        
        VStack(spacing: 20){ //vertical stack of text and images
            Text("Matthew Dick on being a Prototyping Instructor")
                .font(.custom("Georgia", size: 20))
            Text("The Invention Studio at Georgia Tech sets itself apart from other Makerspaces across the country. It matters not your GPA, major, or interests. Anyone has open access to the creative space for their projects. Matthew Dick, a Prototyping Instructor (PI) at the Georgia Tech Invention Studio, talks about the history of the Makerspace and how it is used.")
                .font(.custom("Georgia", size: 13)) //description text with qualities
                .foregroundColor(.secondary)
                .font(.caption)
            
            Image(uiImage: self.data.count == 0 ? UIImage(named: "matthew")! : UIImage(data: self.data)!) //matthew image as ui image
            .resizable()
            .frame(width: self.data.count == 0 ? 150 : nil, height: 150)
            .cornerRadius(15) //rounded corners of image
            
            Text(self.title).font(.title).padding(.top) //set padding
            
            ZStack(alignment: .leading) { //zstack for capsules
            
                Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                
                Capsule().fill(Color.red).frame(width: self.width, height: 8)
                .gesture(DragGesture()
                    .onChanged({ (value) in //setting ui of capsules
                        
                        let x = value.location.x //location
                        
                        self.width = x //width for capsultes
                        
                    }).onEnded({ (value) in
                        
                        let x = value.location.x
                        
                        let screen = UIScreen.main.bounds.width - 30 //screen width
                        
                        let percent = x / screen //finding percent
                        
                        self.player.currentTime = Double(percent) * self.player.duration
                        //finding current play time
                    }))
            }
            .padding(.top) //add padding
            
            HStack(spacing: UIScreen.main.bounds.width / 5 - 30){ //new hstack proportionate to width of screen
                
                     NavigationLink(destination: marionView()) {
                        Image(systemName: "backward.fill").font(.title)
                       } //navigates to the previous audio
                //backward arrow image
                
                
                    Button(action: { //this button goes back 15 seconds in the audio
                        
                        self.player.currentTime -= 15
                         //sets action of button to affect currentTime
                    }) {
                
                        Image(systemName: "gobackward.15").font(.title)
                        //image of go backward
                    }
                
                    Button(action: { //this button pauses and unpauses the audio
                        
                        if self.player.isPlaying{ //checks if its playing
                            
                            self.player.pause() //pauses audio
                            self.playing = false //sets playing to false
                        }
                        else{
                            
                            if self.finish{ //if audio is over
                                
                                self.player.currentTime = 0 //resets audio
                                self.width = 0 //sets beginning to left of screen
                                self.finish = false
                                
                            }
                            
                            self.player.play() //begins to play over again
                            self.playing = true
                        }
                        
                    }) {
                
                        Image(systemName: self.playing && !self.finish ? "pause.fill" : "play.fill").font(.title)
                        //switches icons between play and pause
                    }
                
                    Button(action: { //this button increments the time by 15 seconds
                       
                        let increase = self.player.currentTime + 15 //increment currentTime
                        
                        if increase < self.player.duration{
                            
                            self.player.currentTime = increase //if not done playing
                        }
                        
                    }) {
                
                        Image(systemName: "goforward.15").font(.title) //sets image
                        
                    }
                NavigationLink(destination: georgiaView()) {
                    Image(systemName: "forward.fill").font(.title) //navigates to the next interview
                }
                
            }.padding(.top,25)
            .foregroundColor(.black) //sets color
            
        }.padding()
        .onAppear { //when view appears
            
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
            //gets the url for the audio
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            //player set to contents of the audio url
            self.player.delegate = self.del
            //sets to self play
            self.player.prepareToPlay()
            self.getData()
            //get data from the url to play
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                //use timer to move along audio
                if self.player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 30
                    
                    let value = self.player.currentTime / self.player.duration
                    //find current ratio in audio
                    self.width = screen * CGFloat(value) //set bar to show where you are in audio
                }
            }
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                //notification
                self.finish = true //when done playing
            }
        }
        
    }
    
    
    func getData(){
        //get data from the audio file
        
        let asset = AVAsset(url: self.player.url!)
        //variable for the url
        for i in asset.commonMetadata{
            
            if i.commonKey?.rawValue == "artwork"{
                //artowkr for url
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title"{
                //value of title
                let title = i.value as! String
                self.title = title
            }
        }
    }
    
}

class AVdelegate : NSObject,AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    } //sends notification for when the audio is done playing
    //as a separate class
}
