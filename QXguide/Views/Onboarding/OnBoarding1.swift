//
//  OnBoarding1.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI
import AppTrackingTransparency

struct OnBoarding1: View {
    @Binding var currentPage : myTabs
    let att = ATTObserver()
    var body: some View {
        VStack(spacing: 0){
            Text("Welcome!")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .center)
                .padding(.bottom, 35)
            
            Text("Our application will introduce you to the market, suitable for both beginners and experienced traders")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(width: 343, height: 69)
            
            Spacer()
            
            Image("onb1")
                .resizable()
                .frame(width: 343, height: 224)
                
            Spacer()
            
            Text("Let's introduce you \nto the functionality,you will like it!")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .frame(width: 343)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .padding(.bottom, 35)
            
            
            Button(action: {
                att.requestTrackingAuthorization {
                    currentPage = .two
                }
            }, label: {
                Text("Continue")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(maxWidth: 343, maxHeight: 53)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(red: 0/255, green: 211/255, blue: 126/255))
                    }
            })
            .padding(.bottom, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color(red: 0/255, green: 211/255, blue: 126/255), Color(red: 22/255, green: 24/255, blue: 30/255)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        )
        .foregroundColor(.white)
        
        
    }
}

