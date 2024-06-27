//
//  LoadingView.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var show = false
    @Binding var rot : Double
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Image("logo")
                .resizable()
                .frame(width: 150, height: 123)
            if show{
                VStack{
                    Spacer()
                    Image("loadicon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rot))
                        .padding(.bottom, 50)
                        .onReceive(timer, perform: { _ in
                            withAnimation(.easeIn){
                                rot += 10
                            }
                        })
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color(red: 0/255, green: 211/255, blue: 126/255), Color(red: 22/255, green: 24/255, blue: 30/255)], startPoint: .top, endPoint: .bottom)
        )
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation {
                    show = true
                }
            }
        }
    }
}

