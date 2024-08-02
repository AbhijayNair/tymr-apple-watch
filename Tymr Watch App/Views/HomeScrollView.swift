//
//  HomeScrollView.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//

import SwiftUI

let timerOptions: [TimerOption] = [
        TimerOption(title: "Workout Rest \nTimer", helperImage: "figure.strengthtraining.traditional", timerId: "workout"),
        TimerOption(title: "Pomodoro \nTimer", helperImage: "fitness.timer.fill", timerId: "pomodoro"),
    ]

struct HomeScrollView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment:.leading, spacing: 1){
                    ForEach(timerOptions) { timerOption in
                        NavigationLink(destination: TimerView(title: timerOption.timerId)) {
                            HomeTimerCard(title: timerOption.title, helperImage: timerOption.helperImage)
                                .padding()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }.navigationTitle("Tymr")
        }
        .navigationBarBackButtonHidden()
        .onAppear{
            workoutManager.requestAuthorization()
        }
    }
}

#Preview {
    HomeScrollView()
}
