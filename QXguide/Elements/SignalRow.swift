//
//  SignalRow.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 15.03.2024.
//

import SwiftUI

struct SignalRow: View {
    @State var row : TimerModel
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Image(row.img)
                    .resizable()
                    .frame(width: 32, height: 32)
                Text(row.name)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Text(row.remainingTimeString)
                    .font(.system(size: 14))
                
                if row.buy {
                    HStack(spacing: 0) {
                        Image("buy")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Buy")
                            .font(.system(size: 16))
                            .foregroundColor(.green)
                    }
                }
                else{
                    HStack(spacing: 0) {
                        Image("sell")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Sell")
                            .font(.system(size: 16))
                            .foregroundColor(.red)
                    }
                }
            }
            VStack(alignment: .trailing){
                ZStack(alignment: .leading){
                    if Double(row.remainingTime/row.duration) > 0.66 {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.green)
                            .frame(height: 4)
                            
                    }
                    else if Double(row.remainingTime/row.duration) > 0.33 {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.yellow)
                            .frame(height: 4)
                    }
                    else if Double(row.remainingTime/row.duration) > 0.01 {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.red)
                            .frame(height: 4)
                    }
                    
                    ZStack{
                        if Double(row.remainingTime/row.duration) > 0.66 {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 16)
                        }
                        else if Double(row.remainingTime/row.duration) > 0.33 {
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 16)
                        }
                        else if Double(row.remainingTime/row.duration) > 0.01 {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 16)
                        }
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 4)
                        
                    }
                }
            }
        }
    }
}
