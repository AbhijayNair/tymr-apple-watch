//
//  WorkoutNavView.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/17/24.
//

import SwiftUI

struct WorkoutNavView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.dismiss) var dismiss
    @Binding var tabSelection : Tab
    @Binding var startTime: Date
    @Binding var isTimerRunning: Bool
    @Binding var isActiveShortBreak: Bool
    @Binding var isActiveLongBreak: Bool
    
    func pausePressed() -> Void{
        if isTimerRunning == true && workoutManager.isSessionRunning == true && isActiveShortBreak == false && isActiveLongBreak == false{
            workoutManager.pause()
            isTimerRunning = false
        }
        self.tabSelection = .home
    }
    
    func resumePressed() -> Void{
        if isTimerRunning == false && workoutManager.isSessionRunning == false && isActiveShortBreak == false && isActiveLongBreak == false{
            workoutManager.resume()
            isTimerRunning = true
        }
        self.tabSelection = .home
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Button {
                        workoutManager.endWorkout()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }.tint(.red).font(.title2)
                    Text("End")
                }
                VStack{
                    Button {
                        if workoutManager.isSessionRunning == true && isTimerRunning == true{
                            pausePressed()
                        }
                        else if workoutManager.isSessionRunning == false && isTimerRunning == false{
                            resumePressed()
                        }
                        else{
                            self.tabSelection = .home
                        }
                    } label: {
                        isTimerRunning == true ? Image(systemName: "pause") : Image(systemName: "play")
                    }.tint(.yellow).font(.title2)
                    isTimerRunning == true ? Text("Pause") : Text("Resume")
                }
            }
        }
    }
    
//    #Preview {
//        WorkoutNavView(tabSelection: $tabSelection, startTime: $startTime, isTimerRunning: $isTimerRunning, isActiveShortBreak: $isActiveShortBreak, isActiveLongBreak: $isActiveLongBreak)
//    }
}
