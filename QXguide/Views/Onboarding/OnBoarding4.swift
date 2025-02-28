//
//  OnBoarding4.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI
import StoreKit

struct OnBoarding4: View {
    @Binding var currentPage : myTabs
    var body: some View {
        
        VStack(spacing: 0){
            Text("Help us to improve the app")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .center)
                .padding(.bottom, 10)
            
            Text("Other users about us")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 190/255, green: 191/255, blue: 210/255))
            Spacer()
            Image("onb4")
                .resizable()
                .frame(width: 343, height: 206)
                .padding(.vertical, 20)
            Spacer()
            
            Button(action: {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: windowScene)
                }
                currentPage = .five
            }, label: {
                Text("Show")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .frame(maxWidth: 343, maxHeight: 53)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(red: 0/255, green: 211/255, blue: 126/255))
                    }
            })
            .padding(.top, 20)
            .padding(.bottom, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color(red: 0/255, green: 211/255, blue: 126/255), Color(red: 22/255, green: 24/255, blue: 30/255)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        )
        .foregroundColor(.white)
        
        
    }
}
