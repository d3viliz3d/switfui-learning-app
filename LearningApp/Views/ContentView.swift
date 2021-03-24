//
//  ContentView.swift
//  LearningApp
//
//  Created by Cristian Guerra on 24/3/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                if model.currentModule != nil {
                    ForEach(model.currentModule!.content.lessons) { lesson in
                        NavigationLink(
                            destination: ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(lesson.id)
                                }),
                            label: {
                                ContentViewRow(lesson: lesson)
                            })
                    }
                }
            }
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            .accentColor(.black)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
