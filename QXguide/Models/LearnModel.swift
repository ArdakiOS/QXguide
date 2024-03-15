//
//  LearnModel.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import Foundation

struct LearnModel : Hashable, Codable {
    let lvl : Int
    let name : String
    let text: String
    var passed : Bool
}
