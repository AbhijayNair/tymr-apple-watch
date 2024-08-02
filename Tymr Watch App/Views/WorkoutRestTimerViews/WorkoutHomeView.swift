//
//  WorkoutHomeView.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/17/24.
//

import SwiftUI

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}



struct WorkoutHomeView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Binding var startTime: Date
    @Binding var isTimerRunning: Bool
    @Binding var isActiveShortBreak: Bool
    @Binding var isActiveLongBreak: Bool
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var restTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var interval = TimeInterval()
    @State var shortBreakText: String = "Short Break"
    @State var counterShort: Int = 120
    @State var countToShort: Int = 120
    @State var counterLong: Int = 240
    @State var countToLong: Int = 240
    @State var longBreakText: String = "Long Break"
    
    func stopRestTimer(type: Int) -> Void {
        startTime = Date().addingTimeInterval(-interval)
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        self.isTimerRunning = true
        if type == 0{
                self.isActiveShortBreak = false
                self.shortBreakText = "Short Break"
                self.counterShort = 120
        }
        else{
            self.isActiveLongBreak = false
            self.longBreakText = "Long Break"
            self.counterLong = 240
        }
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            // Display the time elapsed for the current workout session
            Text(interval.format(using:[.hour, .minute, .second])).font(.title).foregroundStyle(self.isTimerRunning == true ? .green : .red).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).onReceive(timer, perform: { _ in
                if isTimerRunning {
                    interval = Date().timeIntervalSince(startTime)
                }
            }).onAppear(){
                if !isTimerRunning {
                    timer.upstream.connect().cancel()
                }
                else{
                    startTime = Date().addingTimeInterval(-interval)
                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }
            }
            
            // Display the heart rate from the HealthKit
            HStack {
                Image(systemName: "heart.fill").resizable().foregroundStyle(.red).frame(width: 24, height: 24)
                Text("\(Int(workoutManager.heartRate))").font(.title2).fontWeight(.bold)
                Text("BPM").font(.title3)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            // Display the rest timers
            HStack {
                Text(shortBreakText).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(width: 64, height:64, alignment: .center).padding().overlay(
                    ZStack {
                        Circle().stroke(lineWidth: 4.0).foregroundStyle(.gray).overlay(
                            Circle().trim(from: 0, to: ((CGFloat(counterShort)+270) / (CGFloat(countToShort)+270))).stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round)).foregroundStyle(.orange)).animation(.easeInOut(duration: 0.2), value: self.counterShort)
                    }).padding(8)
                    .onTapGesture {
                        if !isActiveShortBreak && !isActiveLongBreak && isTimerRunning{
                            self.isTimerRunning = false
                            self.isActiveShortBreak = true
                            self.counterShort = 0
                        }
                        else if isActiveShortBreak && !isActiveLongBreak {
                            stopRestTimer(type:0)
                        }
                    }.onReceive(restTimer, perform: { _ in
                        if !self.isTimerRunning && isActiveShortBreak {
                            if self.counterShort < self.countToShort {
                                self.counterShort += 1
                                let currTime = self.countToShort - self.counterShort
                                let seconds = currTime%60
                                let minutes = Int(currTime/60)
                                self.shortBreakText = "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
                            }
                            else{
                                stopRestTimer(type:0)
                            }
                        }
                    })
                    .sensoryFeedback(trigger: isActiveShortBreak){ start, end in
                        if start == true {
                            return .start
                        }
                        else {
                            return .start
                        }
                    }
                
                Text(longBreakText).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(width: 64, height:64, alignment: .center).padding().overlay(
                    ZStack {
                        Circle().stroke(lineWidth: 4.0).foregroundStyle(.gray).overlay(
                            Circle().trim(from: 0, to: (CGFloat(counterLong) / CGFloat(countToLong))).stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round)).foregroundStyle(.red)).animation(.easeInOut(duration: 0.2), value: self.counterLong)
                    }).padding(8)
                    .onTapGesture {
                        if !isActiveShortBreak && !isActiveLongBreak && isTimerRunning{
                            self.isTimerRunning = false
                            self.counterLong = 0
                            self.isActiveLongBreak = true
                        }
                        else if isActiveLongBreak && !isActiveShortBreak {
                            stopRestTimer(type:1)
                        }
                    }.onReceive(restTimer, perform: { _ in
                        if !self.isTimerRunning && isActiveLongBreak {
                            if self.counterLong < self.countToLong {
                                self.counterLong += 1
                                let currTime = self.countToLong - self.counterLong
                                let seconds = currTime%60
                                let minutes = Int(currTime/60)
                                self.longBreakText = "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
                            }
                            else{
                                stopRestTimer(type:1)
                            }
                        }
                    }).sensoryFeedback(trigger: isActiveLongBreak){ start, end in
                        if start == true {
                            return .start
                        }
                        else {
                            return .start
                        }
                    }
                
              
            }.padding()
        }.scenePadding()
    }
}
