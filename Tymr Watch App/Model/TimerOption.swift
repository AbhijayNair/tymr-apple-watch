//
//  TimerOption.swift
//  Tymr Watch App
//
//  Created by Abhijay Nair on 7/11/24.
//

import Foundation

struct TimerOption: Identifiable {
    let title: String
    let helperImage: String
    let timerId: String
    var id: String {timerId}
}
