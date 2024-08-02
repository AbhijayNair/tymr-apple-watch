//
//  TymrApp.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//

import SwiftUI

@main
struct Tymr_Watch_AppApp: App {
    
    @StateObject var workoutManager = WorkoutManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeScrollView()
            }.environmentObject(workoutManager)
        }
    }
}
