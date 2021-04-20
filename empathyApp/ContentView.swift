//
//  ContentView.swift
//  test
//
//  Created by Pranathi Singareddy on 10/3/20.
//
import SwiftUI
import UIKit


struct ContentView: View {
    @State private var showDetails = false
    @State private var showView = false
    @State private var showAbout = false
    var body: some View {
        NavigationView {
                    VStack {
                        Image("logoCircuitsTech")
                             .resizable()
                             .edgesIgnoringSafeArea(.all)
                             .scaledToFit()
                     
                         Text("Empathy Bytes")
                             .fontWeight(.bold)
                             .font(.custom("Georgia", size: 40))
                             .foregroundColor(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255))
                            .padding()
                        NavigationLink(destination: interviewView()) {
                            Text("Interviews")
                                .fontWeight(.bold)
                                .font(.custom("Georgia", size: 25))
                                .padding()
                                .background(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255), lineWidth: 5)
                                )
                        }
                        NavigationLink(destination: MusicView()) {
                            Text("Podcasts")
                                .fontWeight(.bold)
                                .font(.custom("Georgia", size: 25))
                                .padding()
                                .background(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255), lineWidth: 5)
                                )
                        }
                        NavigationLink(destination: AboutUs()) {
                            Text("About Us")
                                .fontWeight(.bold)
                                .font(.custom("Georgia", size: 25))
                                .padding()
                                .background(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255), lineWidth: 5)
                                )
                        }
                        NavigationLink(destination: VRMenuView()) {
                            Text("VR")
                                .fontWeight(.bold)
                                .font(.custom("Georgia", size: 25))
                                .padding()
                                .background(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255))
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0 / 255, green: 48 / 255, blue: 87 / 255), lineWidth: 5)
                                )
                        }
                    }
                }
        
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
