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
        MusicPlayer().navigationTitle("Matthew Dick")

       
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}

struct MusicPlayer : View {
    
    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["dickAudio"]
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("matthew") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("Go back")
                }
            }
        }
    var body : some View{
        
        
        VStack(spacing: 20){
            Text("Matthew Dick on being a Prototyping Instructor")
                .font(.custom("Georgia", size: 20))
            Text("The Invention Studio at Georgia Tech sets itself apart from other Makerspaces across the country. It matters not your GPA, major, or interests. Anyone has open access to the creative space for their projects. Matthew Dick, a Prototyping Instructor (PI) at the Georgia Tech Invention Studio, talks about the history of the Makerspace and how it is used.")
                .font(.custom("Georgia", size: 13))
                .foregroundColor(.secondary)
                .font(.caption)
            
            Image(uiImage: self.data.count == 0 ? UIImage(named: "matthew")! : UIImage(data: self.data)!)
            .resizable()
            .frame(width: self.data.count == 0 ? 150 : nil, height: 150)
            .cornerRadius(15)
            
            Text(self.title).font(.title).padding(.top)
            
            ZStack(alignment: .leading) {
            
                Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                
                Capsule().fill(Color.red).frame(width: self.width, height: 8)
                .gesture(DragGesture()
                    .onChanged({ (value) in
                        
                        let x = value.location.x
                        
                        self.width = x
                        
                    }).onEnded({ (value) in
                        
                        let x = value.location.x
                        
                        let screen = UIScreen.main.bounds.width - 30
                        
                        let percent = x / screen
                        
                        self.player.currentTime = Double(percent) * self.player.duration
                    }))
            }
            .padding(.top)
            
            HStack(spacing: UIScreen.main.bounds.width / 5 - 30){
                
                     NavigationLink(destination: marionView()) {
                        Image(systemName: "backward.fill").font(.title)
                       }
                
                
                    Button(action: { //this button goes back 15 seconds in the audio
                        
                        self.player.currentTime -= 15
                        
                    }) {
                
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
                                self.finish = false
                                
                            }
                            
                            self.player.play()
                            self.playing = true
                        }
                        
                    }) {
                
                        Image(systemName: self.playing && !self.finish ? "pause.fill" : "play.fill").font(.title)
                        
                    }
                
                    Button(action: { //this button increments the time by 15 seconds
                       
                        let increase = self.player.currentTime + 15
                        
                        if increase < self.player.duration{
                            
                            self.player.currentTime = increase
                        }
                        
                    }) {
                
                        Image(systemName: "goforward.15").font(.title)
                        
                    }
                NavigationLink(destination: georgiaView()) {
                    Image(systemName: "forward.fill").font(.title)
                }
                
            }.padding(.top,25)
            .foregroundColor(.black)
            
        }.padding()
        .onAppear {
            
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            self.player.delegate = self.del
            
            self.player.prepareToPlay()
            self.getData()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                
                if self.player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 30
                    
                    let value = self.player.currentTime / self.player.duration
                    
                    self.width = screen * CGFloat(value)
                }
            }
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                
                self.finish = true
            }
        }
        
    }
    
    
    func getData(){
        
        
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

class AVdelegate : NSObject,AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}
