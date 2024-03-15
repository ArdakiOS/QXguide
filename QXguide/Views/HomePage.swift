//
//  HomePage.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI
enum MainPages {
    case pairs, learn, main
}

struct HomePage: View {
    @State var curPage = MainPages.main
    var body: some View {
        switch curPage {
        case .pairs:
            PairsPage(curPage: $curPage)
        case .learn:
            LearnPage(curPage: $curPage)
        case .main:
            VStack(alignment: .leading){
                Text("Main")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.bottom, 25)
                
                VStack(alignment: .center, spacing: 10){
                    Text("Welcome")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Text("We invite you to learn the basics of the Forex and binary options market using our application. Choose any of the courses to improve your knowledge, good luck!")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                    
                }
                .frame(width: 343)
                
                Spacer()
                
                VStack{
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)){
                            curPage = .pairs
                        }
                    } label: {
                        HStack{
                            Text("Pairs")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Spacer()
                            Image("pairs")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.horizontal)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("ActiveTab"))
                        )
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)){
                            curPage = .learn
                        }
                    } label: {
                        HStack{
                            Text("Learn")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Spacer()
                            Image("learn")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.horizontal)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("ActiveTab"))
                        )
                    }

                    
                    Button {
                        UIApplication.shared.open(URL(string: "https://ru.tradingview.com/education/riskmanagement/")!)
                    } label: {
                        HStack{
                            Text("Risk")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Spacer()
                            Image("risk")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.horizontal)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("ActiveTab"))
                        )
                    }


                }
                .frame(width: 343, height: 192)
                
                Spacer()
            }
            .foregroundColor(.white)
        }
        
        
    }
}

#Preview {
    NavView(currentPage: .home)
}
