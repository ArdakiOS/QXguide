//
//  SignalsPage.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct SignalsPage: View {
    @ObservedObject var sigVM : SignalsVM
    var body: some View {
        VStack(alignment: .leading, spacing: 75){
            Text("Signals")
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            VStack(alignment: .center){
                Text("The next signal is via:")
                Text(sigVM.signals.min(by: { $0.remainingTime < $1.remainingTime })?.remainingTimeString ?? "")
                    .foregroundColor(Color("InactiveTab"))
            }
            .font(.system(size: 24))
            .fontWeight(.bold)
            .frame(width: 343, height: 122)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("TabRow"))
            )
            
            
            VStack(spacing: 25){
                ForEach(sigVM.signals, id: \.self){row in
                    VStack(spacing: 0){
                        HStack{
                            Image(row.img)
                                .resizable()
                                .frame(width: 32, height: 32)
                            Spacer()
                            Text(row.name)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Spacer()
                            Text(row.remainingTimeString)
                                .font(.system(size: 14))
                            Spacer()
                            if row.buy {
                                HStack(spacing: 10) {
                                    Image("buy")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("Buy")
                                        .font(.system(size: 16))
                                        .foregroundColor(.green)
                                }
                            }
                            else{
                                HStack(spacing: 10) {
                                    Image("sell")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    Text("Sell")
                                        .font(.system(size: 16))
                                        .foregroundColor(.red)
                                }
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        
                        
                    }
                    .frame(width: 343, height: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("TabRow"))
                    )
                    .overlay(alignment: .bottom) {
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
                        .frame(width: 343 * CGFloat((row.remainingTime / row.duration)))
                        .frame(width: 343, alignment: .trailing)
                        .offset(y: 5)
                    }
                }
            }

            
            
            
            
        }

        
        .foregroundColor(.white)
    }
}

#Preview {
    NavView(currentPage: .signals)
}
