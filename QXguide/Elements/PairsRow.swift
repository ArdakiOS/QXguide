//
//  PairsRow.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct PairsRow: View {
    let row : PairsModel
    var body: some View {
        HStack{
            Image(row.img)
                .resizable()
                .frame(width: 32, height: 32)
                .frame(width: 48, height: 48)
                .background(
                    Circle().fill(Color("pairsbg"))
                )
            Text(row.name)
                .font(.system(size: 16))
                .fontWeight(.regular)
            Spacer()
        }
        .padding(.horizontal)
        .frame(width: 343, height: 64)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("TabRow"))
        )
    }
}

#Preview {
    NavView()
}
