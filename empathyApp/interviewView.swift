//
//  interviewView.swift
//  test
//
//  Created by Molly Brigham on 10/28/20.
//
import SwiftUI
import UIKit

//this view represents the scroll page of interviews available to watch
struct interviewView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
       
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("EMPATHY BYTES")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Interviews")
                            .font(.custom("Georgia", size: 30))
                            .fontWeight(.black)
                    } //interview header
                    
                    Spacer()
                }
                .padding([.horizontal])
                //contains navigations to each interview, using cardview class that specifies the components of each card as image, date, title, and author
                ScrollView {
                                        NavigationLink(destination: matthewView()) {
                        cardView(image: "invention", category: "April 30, 2020", heading: "Matthew Dick on being a Prototyping Instructor", author:"by Jaewon Drake")
                    }
                    NavigationLink(destination: georgiaView()) {
                        cardView(image: "ringgold", category: "February 27, 2020", heading: "Ringgold, Georgia: Lara Langston", author:"by Hunter Copp")
                    }
                    NavigationLink(destination: marionView()) {
                        cardView(image: "distmath", category: "November 29, 2019", heading: "Dr. Marion Usselman on the Distance Math Program", author:"by Jaewon Drake")
                    }
 
            }
            
            
        
        
            }
    
}

struct interviewView_Previews: PreviewProvider {
    static var previews: some View {
        interviewView()
    }
}
}
