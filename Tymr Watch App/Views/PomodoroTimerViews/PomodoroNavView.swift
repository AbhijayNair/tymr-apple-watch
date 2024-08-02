//
//  PomodoroNavView.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/21/24.
//

import SwiftUI

struct PomodoroNavView: View {
    
    // Use the dismiss routine to exit out of the timer to the main scroll view
    @Environment(\.dismiss) var dismiss
    @Binding var tabSelection : PomodoroTabs
    @Binding var isTimerRunning: Bool
    @Binding var isActiveShortBreak: Bool
    
    /**
            The timer can be paused while in a pomodoro, provided the break is not in effect.
     
     */
    func pausePressed() -> Void{
        if isTimerRunning == true && isActiveShortBreak == false{
            isTimerRunning = false
        }
        self.tabSelection = .timer
    }
    
    /**
            If the timer is not running and the user is currently not within a break, the timer
     can be resumed. It beats the purpose of the timer if it is resumed while on a break.
    
     */
    func resumePressed() -> Void{
        if isTimerRunning == false && isActiveShortBreak == false{
            isTimerRunning = true
        }
        // Go back to the main timer tab if an illegal move is performed
        self.tabSelection = .timer
    }
    
    // Only two buttons, to pause and to end the entire Pomodoro Timer
    var body: some View {
        NavigationStack {
            HStack {
                VStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }.tint(.red).font(.title2)
                    Text("End")
                }
                VStack{
                    Button {
                        if isTimerRunning == true{
                            pausePressed()
                        }
                        else if isTimerRunning == false{
                            resumePressed()
                        }
                        else{
                            self.tabSelection = .timer
                        }
                    } label: {
                        isTimerRunning == true ? Image(systemName: "pause") : Image(systemName: "play")
                    }.tint(.yellow).font(.title2)
                    isTimerRunning == true ? Text("Pause") : Text("Resume")
                }
            }
        }
    }
}

//#Preview {
//    PomodoroNavView()
//}
