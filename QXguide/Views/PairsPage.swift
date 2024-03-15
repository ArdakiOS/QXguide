//
//  PairsPage.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct PairsPage: View {
    let pairsArr : [PairsModel] = [
        PairsModel(img: "eurusd", name: "EUR/USD", text: "The EUR/USD pair has become the most widely-traded pair in the world. The pair represents a combination of two of the biggest economies in the world. It is affected by factors that influence the value of the euro and the U.S. dollar in relation to each other and to other currencies. For this reason, the interest rate differential between the European Central Bank (ECB) and the Federal Reserve (Fed) affects the value of these currencies when compared to each other."),
        PairsModel(img: "usdjpy", name: "USD/JPY", text: "American dollar versus Japanese yen. This currency pair ranks 2nd among the leading positions. This currency pair accounts for about 10% of all transactions carried out on the foreign exchange market. It is believed that it occupies one of the first places in terms of liquidity, that is, in terms of trading volume, because, firstly, the American dollar is a priori a world currency, and secondly, because the Japanese economy is fundamentally different from the economies of all developed countries in the world."),
        PairsModel(img: "gbpusd", name: "GBP/USD", text: "British pound sterling against the American dollar. In terms of liquidity, this currency pair represents about 9% of all transactions concluded on the most global trading platform. It remains in 3rd place in the leading list, but this does not mean that this currency pair is not in demand among market participants. After all, its volatility is up to 1390 points per day! This is the most highly volatile instrument among currency pairs in the Forex market."),
        PairsModel(img: "eurcad", name: "EUR/CAD", text: "Euro and Canadian dollar. The euro is the second most popular reserve currency in the world and is considered quite stable. The Canadian dollar is the seventh most traded currency in the world. It is highly dependent on minerals exported by Canada, especially oil."),
        PairsModel(img: "eurgbp", name: "EUR/GBP", text: "Euro and British pound. This pair is a cross between the two most powerful economies in Europe - the Eurozone and the UK. This pair is much less volatile than other euro or pound based pairs due to the similarity of economies and interdependence between them. Changes in monetary policy between the Bank of England and the European Central Bank could lead to large fluctuations in the pair."),
        PairsModel(img: "cadchf", name: "CAD/CHF", text: "The Canadian dollar and Swiss franc pair is most often used as a carry trade instrument, due to the relationship between a low-volatility, safe-haven currency (CHF) and a more volatile, strengthening currency (CAD). The CHF is considered a safe and low-volatility currency due to Switzerland's reputation as a \"safe haven\" for foreigners who want to deposit their wealth in a foreign private banking system. The CAD is considered a commodity currency due to Canada's natural resource exports, making it sensitive to investors' forecasts for global economic growth.")
    
    ]
    
    @State var selectedRow : PairsModel?
    @State var showDetail = false
    @Binding var curPage : MainPages
    
    var body: some View {
        if showDetail{
            DetailedPair(pair: selectedRow!, show: $showDetail)
        }
        else{
            VStack(alignment: .leading){
                HStack{
                    Text("Pairs")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)){
                            curPage = .main
                        }
                    } label: {
                        Text("Back")
                    }
                    
                }
                .frame(width: 343)
                .padding(.bottom, 30)
                
                ForEach(pairsArr , id: \.self){row in
                    Button {
                        withAnimation(.easeInOut(duration: 0.4)){
                            selectedRow = row
                            showDetail = true
                        }
                    } label: {
                        PairsRow(row: row)
                    }
                    
                    
                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    NavView(currentPage: .home)
}
