//
//  marionView.swift
//  test
//
//  Created by Molly Brigham on 10/28/20.
//
import SwiftUI

struct marionView: View {
    @State private var showDetails = false
    var body: some View {
        VStack {
            Text("Dr. Marion Usselman on the Distance Math Program")
                .font(.custom("Georgia", size: 30))
                .fontWeight(.black)
            Image("marion")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
            Text("Dr. Marion Usselman of the Center for Education Integrating Science, Mathematics, and Computing (CEISMC) talks about the origins of the Distance Math Program at Georgia Tech and her role as a pioneer in its creation and evolution. ")
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
                        Sounds.playSounds(soundfile: "marionAudio.mp3")
                
                
                        })
            
            {
                            Text("Play")
                                
                        }
        }
        
    }
}

struct marionView_Previews: PreviewProvider {
    static var previews: some View {
        marionView()
    }
}
