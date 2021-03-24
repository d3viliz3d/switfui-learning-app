//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Cristian Guerra on 24/3/2564 BE.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let videoUrl = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            VideoPlayer(player: AVPlayer(url: videoUrl!))
                .cornerRadius(10)
            
            Text("Desc")
            
            Button(action: {
                model.nextLesson()
            }, label: {
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(height: 48)
                    
                    Text("Next lesson")
                }
            })
        }
        .padding()
        
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .environmentObject(ContentModel())
    }
}
