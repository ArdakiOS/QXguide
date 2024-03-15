//
//  LearnRow.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct LearnRow: View {
    @State var row : LearnModel
    @State var currentLvl : Int
    var body: some View {
        HStack{
            Text("Lvl")
            Text("\(row.lvl)")
            Text("-")
            Text(row.name)
                .overlay{
                    if row.passed {
                        Rectangle()
                            .frame(height: 2)
                            .offset(y: 1)
                    }
                }
            Spacer()
            
            if row.passed{
                Image("learnrow")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            else if currentLvl == row.lvl {
                Text("Open")
                    .font(.system(size: 12))
                    .frame(width: 47, height: 24)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("ActiveTab"))
                    )
            }
        }
        .font(.system(size: 16))
        .padding(.horizontal)
        .frame(width: 343, height: 48)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("TabRow"))
        )
        .foregroundColor(.white)
    }
}
