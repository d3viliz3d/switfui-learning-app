//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Cristian Guerra on 24/3/2564 BE.
//

import SwiftUI

struct ContentViewRow: View {
    
    var lesson: Lesson
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 65)
            
            HStack {
                Text(String(lesson.id))
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .font(.headline)
                    Text(lesson.duration)
                }
            }
            .foregroundColor(.black)
        }
    }
}
