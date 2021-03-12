//
//  cardView.swift
//  test
//
//  Created by Molly Brigham on 10/28/20.
//
import SwiftUI
import UIKit


struct cardView: View {
    var image: String
    var category: String
    var heading: String
    var author: String
    
    
    var body: some View {
        
            VStack {
                Image(image)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                HStack {
                    VStack(alignment: .leading) {
                        Text(category)
                            .font(.custom("Georgia", size: 25))
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(heading)
                            .font(.custom("Georgia", size: 25))
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(author)
                            .font(.custom("Georgia", size: 25))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                }
                .padding()
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .padding([.top, .horizontal])
        }
        
        
            
    
}

struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView(image: "invention", category: "April 30, 2020", heading: "Matthew Dick on being a Prototyping Instructor", author:"by Jaewon Drake")
    }
}

