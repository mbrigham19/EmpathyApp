//
//  SwiftUIView.swift
//  HomeScreen
//
//  Created by Pranathi Singareddy on 10/13/20.
//
import SwiftUI

struct CircleImage: View {


    var body: some View {
       
        Image("logoCircuitsTech")
            .resizable()
            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
