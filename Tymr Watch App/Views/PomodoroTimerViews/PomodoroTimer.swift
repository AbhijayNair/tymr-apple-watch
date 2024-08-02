//
//  PomodoroTimer.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//


import SwiftUI


import SwiftUI

struct PomodoroTimer: View {
    
    // Programatically control the selected tab to enable quick navigation
    @State private var selection: PomodoroTabs = .timer
    @State var startTime: Date = Date()
    @State var isTimerRunning = true
    @State var isActiveShortBreak: Bool = false
    @State var iteration: Int = 0
    
    var body: some View {
        
        TabView (selection: $selection){
            PomodoroNavView(tabSelection: $selection, isTimerRunning: $isTimerRunning, isActiveShortBreak: $isActiveShortBreak).tag(PomodoroTabs.navigation)
            PomodoroHomeView(startTime: $startTime, isTimerRunning: $isTimerRunning, isActiveShortBreak: $isActiveShortBreak, pomodoroIteration: $iteration).tag(PomodoroTabs.timer)
        }
    }
}

// The tab indicators for the horizontal tab view
enum PomodoroTabs{
    case navigation, timer
}

#Preview {
    PomodoroTimer()
}
