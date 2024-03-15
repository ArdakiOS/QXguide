//
//  NavTab.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct NavTabBar: View {
    @Binding var selectedTab : NavTabs
    var body: some View {
        ZStack {
            Color("MainBg").ignoresSafeArea()
            VStack {
                Divider()
                    .frame(height: 1)
                    .background(Color("InactiveTab"))
                Spacer()
                GeometryReader { geo in
                    HStack(spacing: 0){
                        ForEach(NavTabs.allCases, id: \.self){tab in
                            VStack{
                                Image(tab.rawValue)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text(tab.rawValue)
                                    .font(.system(size: 12))
                                    .fontWeight(.medium)
                            }
                            .frame(width: geo.size.width / 3)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.2)){
                                    selectedTab = tab
                                }
                            }
                            .foregroundColor(selectedTab == tab ? Color("ActiveTab") : Color("InactiveTab"))
                        }
                    }
                    .padding(.top, 5)
                }
                Spacer()
            }
        }
        .frame(height: 70)
    }
}

#Preview {
    NavView()
}
