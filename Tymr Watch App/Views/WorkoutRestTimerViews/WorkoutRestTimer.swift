//
//  WorkoutRestTimer.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//

import SwiftUI
import WatchKit
import HealthKit


struct WorkoutRestTimer: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @State private var tabSelection: Tab = .home
    @State private var isTimerRunning = true
    @State private var pausedSince: Date = Date()
    @State private var startTime: Date = Date()
    @State var isActiveShortBreak: Bool = false
    @State var isActiveLongBreak: Bool = false
    
    var body: some View {
        
        TabView (selection: $tabSelection){
            WorkoutNavView(tabSelection: $tabSelection, startTime: $startTime, isTimerRunning: $isTimerRunning, isActiveShortBreak: $isActiveShortBreak, isActiveLongBreak: $isActiveLongBreak).tag(Tab.controls)
            WorkoutHomeView(startTime: $startTime, isTimerRunning: $isTimerRunning, isActiveShortBreak: $isActiveShortBreak, isActiveLongBreak: $isActiveLongBreak).tag(Tab.home)
            NowPlayingView().tag(Tab.music)
        }.onAppear(){
            startTime = Date()
            workoutManager.startWorkout()
        }
    }

}

enum Tab {
    case controls, home, music
}

#Preview {
    WorkoutRestTimer()
}
