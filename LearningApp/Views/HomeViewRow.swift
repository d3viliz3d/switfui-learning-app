//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Cristian Guerra on 24/3/2564 BE.
//

import SwiftUI

struct HomeViewRow: View {
    
    var title: String
    var image: String
    var description: String
    var countString: String
    var time: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .bold()
                    Text(description)
                        .font(Font.system(size: 14))
                        .padding(.trailing)
                    
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(countString)
                            .font(Font.system(size: 10))
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                    .padding(.top)
                }
                .padding(.leading)
            }
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(title: "Title", image: "swift", description: "some description", countString: "99 lessons", time: "30 mins")
    }
}
