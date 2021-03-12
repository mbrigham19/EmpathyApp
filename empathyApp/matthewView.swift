//
//  matthewView.swift
//  test
//
//  Created by Molly Brigham on 10/30/20.
//
import SwiftUI

struct matthewView: View {
    @State private var showDetails = false
    var body: some View {
        //this view represents the interview view for Matthew Dick and plays the sound file
        VStack {
            Text("Matthew Dick on being a Prototyping Instructor")
                .font(.custom("Georgia", size: 30))
                .fontWeight(.black)
            Image("matthew")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
            Text("The Invention Studio at Georgia Tech sets itself apart from other Makerspaces across the country. It matters not your GPA, major, or interests. Anyone has open access to the creative space for their projects. Matthew Dick, a Prototyping Instructor (PI) at the Georgia Tech Invention Studio, talks about the history of the Makerspace and how it is used.")
                .font(.custom("Georgia", size: 13))
                .foregroundColor(.secondary)
                .font(.caption)
            
            ZStack {
                Capsule()
                    .fill(Color.gray).frame(height: 8)
                    .padding(10)
                Capsule()
                    .fill(Color.orange).frame(width: 12, height: 8)
                    .padding(10)
            }
            Button(action: {
                        self.showDetails.toggle()
                        Sounds.playSounds(soundfile: "dickAudio.mp3")
                
                
                        })
            
            { Text("Play")
                                
                        }
        }
        
        
        

            
    }
}

struct matthewView_Previews: PreviewProvider {
    static var previews: some View {
        matthewView()
    }
}

