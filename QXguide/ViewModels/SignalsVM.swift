//
//  SignalsVM.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 15.03.2024.
//

import Foundation


class SignalsVM : ObservableObject {
    var pairs = ["EUR/USD", "CAD/CHF", "EUR/CAD", "EUR/GBP", "GBP/USD", "USD/JPY"]
    var usedPairs : [String] = []
     
    @Published var signals : [TimerModel] = []
     
    var timerIsOn = false
     
    func addSignal () {
         
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
         
        let currentTime = Date()
         
         
        for _ in 0...Int.random(in: 2...3) {
            let randDur = Int.random(in: 1...5)
            let futureTime = Calendar.current.date(byAdding: .minute, value: randDur, to: currentTime)
            let futureTimeString = formatter.string(from: futureTime!)
             
             
            let randPair = Int.random(in: 0...pairs.count - 1)
            let pair = pairs.remove(at: randPair)
            usedPairs.append(pair)
            let newSig = TimerModel(duration: Double(randDur * 60), name: pair, img: pair.replacingOccurrences(of: "/", with: "").lowercased(), remainingTime: Double(randDur * 60), buy: Bool.random(), endTime: futureTimeString)
            signals.append(newSig)
             
        }
        pairs.append(contentsOf: usedPairs)
         
        signals.sort(by: {$0.duration < $1.duration})
        if !timerIsOn {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
                for index in (0..<signals.count).reversed() {
                    signals[index].remainingTime -= 1
                    if signals[index].remainingTime < 0 {
                        signals.remove(at: index)
                    }
                }
            }
            timerIsOn = true
        }
    }
     
}
