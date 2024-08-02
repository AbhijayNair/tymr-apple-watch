//
//  TimerView.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//

import SwiftUI

struct TimerView: View {
    let title: String
    
    var body: some View {
        if title == "workout"{
            WorkoutRestTimer().navigationBarBackButtonHidden(true)
        }
        else if title == "pomodoro"{
                PomodoroTimer().navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    TimerView(title:"Test Timer")
}
