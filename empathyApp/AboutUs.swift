//
//  AboutUs.swift
//  HomeScreen
//
//  Created by Pranathi Singareddy on 11/3/20.
//
import SwiftUI

struct AboutUs: View {
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("About Us").font(.custom("Georgia", size: 30)).bold().padding(10)
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                
                CircleImage().padding(.top)
                Text("Empathy Bytes focuses on building an immersive digital archive of interviews, photographs, multimedia, and writings from diverse communities. Students explore the connections these communities have to Georgia Tech research and creative endeavors.  Students are given an opportunity to research communities, while documenting their experiences and designing innovative ways of sharing these stories with a broad audience. Archival collections are a tactile way to explore the lived experience of communities allowing the researcher and curator to find themselves in other people’s stories.").font(.custom("Georgia", size: 20)).padding(.top).padding(.horizontal)
                Text("To provide greater access to the course products, the team will produce short form podcasts to showcase the project and collection, as well as the behind the scenes development process.  Students work together to complete the project defining their own roles depending on their area of interests and expertise.").font(.custom("Georgia", size: 20)).padding(.top).padding(.horizontal)
                Text("Empathy Bytes allows the student to define their role in the project through track selection. Each track has a specific focus, but ties into the larger goals of the project. Certain aspects of the project everyone participates in, such as completing interviews and participating in basic research on communities.").font(.custom("Georgia", size: 20)).padding(.top).padding(.horizontal)
                Spacer()
                               
                
            })
        })
        
      
        
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
