//
//  HomeTimerCard.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//

import SwiftUI

struct HomeTimerCard: View {
    
    let title: String
    let helperImage: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .font(.headline)
                Spacer()
                Image(systemName: helperImage)
            }.padding()
            Text("Start").frame(maxWidth:.infinity, alignment: .leading).padding()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(.pink)
        .cornerRadius(8.0)
    }
}

#Preview {
    HomeTimerCard(title: "workout", helperImage: "dumbbell.fill")
}
