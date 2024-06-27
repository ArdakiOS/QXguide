//
//  OnBoarding2.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI
import UserNotifications

struct OnBoarding2: View {
    @Binding var currentPage : myTabs
    var body: some View {
        ZStack(){
            
            Image("onb2")
                .resizable()
                .offset(y: 50)
            
            
            VStack(spacing: 0){
                Text("Don't miss out on new update")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.horizontal, 7)
                    .multilineTextAlignment(.center)
                    .frame(width: 343, alignment: .center)
                    .padding(.bottom, 20)
                Spacer()
                
                
                
                Button(action: {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                        if granted{
                            //
                        }
                        else{
                            print("Not Granted Notif")
                        }
                        currentPage = .three
                    }
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
                .padding(.bottom, 40)
                
            }
            
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color(red: 0/255, green: 211/255, blue: 126/255), Color(red: 22/255, green: 24/255, blue: 30/255)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        )
        
    }
}
