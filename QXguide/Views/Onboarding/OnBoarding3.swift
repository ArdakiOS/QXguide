//
//  OnBoarding3.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct OnBoarding3: View {
    @Binding var currentPage : myTabs
    var body: some View {
        VStack(spacing: 0){
            Text("Affordable training for beginners")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            Spacer()
            VStack(spacing: 0){
                HStack(){
                    Image("onb3")
                        .resizable()
                        .frame(width: 320, height: 205)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                HStack() {
                    Spacer()
                    Image("onb31")
                        .resizable()
                        .frame(width: 300, height: 160)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                currentPage = .four
            }, label: {
                Text("Continue")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(maxWidth: 343, maxHeight: 53)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(red: 88/255, green: 121/255, blue: 236/255))
                    }
            })
            .padding(.top, 20)
            .padding(.bottom, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color(red: 88/255, green: 121/255, blue: 236/255), Color(red: 22/255, green: 24/255, blue: 30/255)], startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        
        
    }
}
