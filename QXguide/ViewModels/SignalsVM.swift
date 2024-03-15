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
    
    func addSignal () {
        guard signals.count < 4 else {
            return
        }
        let randDur = Double.random(in: 60...600)
        let randPair = Int.random(in: 0...pairs.count - 1)
        let pair = pairs.remove(at: randPair)
        usedPairs.append(pair)
        if pairs.isEmpty {
            pairs = usedPairs
        }
        let newSig = TimerModel(duration: randDur, name: pair, img: pair.replacingOccurrences(of: "/", with: "").lowercased(), remainingTime: randDur, buy: Bool.random())
        signals.append(newSig)
        signals.sort(by: {$0.duration < $1.duration})
    }
}
