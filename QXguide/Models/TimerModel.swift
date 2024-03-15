//
//  TimerModel.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 15.03.2024.
//

import Foundation

struct TimerModel : Hashable {
    var duration : Double
    let name : String
    let img : String
    var remainingTime : Double
    var remainingTimeString: String {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    var buy : Bool
}
