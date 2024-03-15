//
//  OnBoarding5.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct OnBoarding5: View {
    @Binding var show : Bool
    var body: some View {
        VStack(spacing: 0){
            Text("A great opportunity")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .frame(width: 343, alignment: .center)
                .padding(.bottom, 10)
            Spacer()
            Image("onb5")
                .resizable()
                .frame(width: 343, height: 192)
                .padding(.vertical, 20)
            Spacer()
            Text("Get your unique experience now")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .frame(width: 343)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
            
            Button(action: {
                withAnimation(.easeInOut){
                    show = false
                }
                UserDefaults.standard.setValue(show, forKey: "showOnb")
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
