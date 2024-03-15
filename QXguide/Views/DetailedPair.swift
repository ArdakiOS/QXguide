//
//  DetailedPair.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct DetailedPair: View {
    @State var pair : PairsModel
    @Binding var show : Bool
    var body: some View {
        VStack{
            Text(pair.name)
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            Image(pair.img)
                .resizable()
                .frame(width: 44, height: 44)
                .frame(width: 66, height: 66)
                .background(
                    Circle().fill(Color("pairsbg"))
                )
            
            Text(pair.text)
                .font(.system(size: 16))
                .frame(width: 343)
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut(duration: 0.4)){
                    show = false
                }
            } label: {
                Text("Back")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 343, height: 45)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("ActiveTab"))
                    )
            }

            
        }
        .foregroundColor(.white)
    }
}
