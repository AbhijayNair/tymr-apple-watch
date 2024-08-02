//
//  WorkoutHomeView.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/17/24.
//

import SwiftUI

struct PomodoroHomeView: View {
    @Binding var startTime: Date
    @Binding var isTimerRunning: Bool
    @Binding var isActiveShortBreak: Bool
    
    // Track the number of pomodoros completed
    @Binding var pomodoroIteration: Int
    @State var textColor: Color = .green
    @State var breakForegroundColor: Color = .black
    
    // The timer that counts up to a set value, will count from 0 to the target interval
    @State var currentPomodoroElapsed: Int = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var interval = TimeInterval()
    @State var timerText: String = ""
    // Change the 25 to a dynamic value later. (25*60 seconds) = 25 minutes
    @State var targetPomodoroInterval: Int = 25 * 60

    var body: some View {
        
        ZStack {
            self.breakForegroundColor.opacity(0.75).ignoresSafeArea()
            VStack {
                
                // Display the time elapsed for the current workout session
                Text(timerText).font(.title).foregroundStyle(textColor).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center).onReceive(timer, perform: { _ in
           
                    self.currentPomodoroElapsed += 1
                    let currTime = self.targetPomodoroInterval - self.currentPomodoroElapsed
                    let seconds = currTime%60
                    let minutes = Int(currTime/60)
                    self.timerText = "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
                    if self.currentPomodoroElapsed >= self.targetPomodoroInterval{
                        if !isActiveShortBreak {
                            handlePomodoroElapsed()
                        }
                        else{
                            handleBreakEnded()
                        }
                        
                    }
                        
                }).onAppear(){
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }
                
                  
            }
        }
    }
    
    /**
            This function handles the completed pomodoro timer. Once 25 minutes of pomodoro is
            complete, the interval is set to five mninutes of break time. If four pomodoros are
            completed, the timer does not reinstantiate.
        
     */
    func handlePomodoroElapsed() -> Void{
        if self.pomodoroIteration < 4 {
            textColor = .white
            breakForegroundColor = .red
            isTimerRunning = false
            isActiveShortBreak = true
            currentPomodoroElapsed = 0
            targetPomodoroInterval = 5 * 60
            pomodoroIteration += 1
        }
        else{
            timerText = "Pomodoro Sprint Completed!"
        }
    }
    
    /**
            Once a break has ended, change the UI back to the pomoodor UI colors and set the
            target timer to 25 minutes, can be changed in the future to make it dynamic.
     
     */
    func handleBreakEnded() -> Void {
        textColor = .green
        breakForegroundColor = .black
        isTimerRunning = true
        isActiveShortBreak = false
        currentPomodoroElapsed = 0
        targetPomodoroInterval = 25 * 60
        
    }
}
