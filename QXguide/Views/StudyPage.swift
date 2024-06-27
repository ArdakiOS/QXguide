//
//  StudyPage.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 24.06.2024.
//

import SwiftUI

struct StudyPage: View {
    @State var showLearn = false
    var body: some View {
        if !showLearn{
            VStack(alignment: .leading){
                Text("Learn")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 343, alignment: .leading)
                Button(action: {
                    showLearn = true
                }, label: {
                    Text("Learn")
                        .padding()
                        .frame(width: 343, height: 105, alignment: .topLeading)
                        .background(
                            RoundedRectangle(cornerRadius: 12).fill(Color(red: 42/255, green: 171/255, blue: 119/255)).overlay(alignment: .bottomTrailing, content: {
                                Image("RiskBig").resizable().frame(width: 118, height: 112)
                            })
                        )
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Risk")
                        .padding()
                        .frame(width: 343, height: 105, alignment: .topLeading)
                        .background(
                            RoundedRectangle(cornerRadius: 12).fill(Color(red: 42/255, green: 171/255, blue: 119/255)).overlay(alignment: .bottomTrailing, content: {
                                Image("LearnBig").resizable().frame(width: 118, height: 112)
                            })
                        )
                    
                })
            }
            .font(.system(size: 20))
            .fontWeight(.semibold)
            .foregroundColor(.white)
        }
        else{
            LearnPage(showLearn: $showLearn)
        }
    }
}

#Preview {
    NavView(currentPage: .study)
}
