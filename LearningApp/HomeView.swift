//
//  ContentView.swift
//  LearningApp
//
//  Created by Cristian Guerra on 23/3/2564 BE.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Time to learn!")
                    .padding(.leading)
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(model.modules) { module in
                            
                            // Learning card
                            HomeViewRow(title: "Learn \(module.category)", image: module.content.image, description: module.content.description, countString: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            
                            // Test card
                            HomeViewRow(title: "\(module.category) Test", image: module.test.image, description: module.test.description, countString: "\(module.test.questions.count) Questions", time: module.test.time)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
