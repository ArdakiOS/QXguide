//
//  AllOnboardingViews.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

enum myTabs : CaseIterable {
    case one
    case two
    case three
    case four
    case five

}

struct AllOnboardingViews: View {
    @State var currentTab : myTabs = .one
    @Binding var showOnboarding : Bool
    var body: some View {
        ZStack{
            switch currentTab {
            case .one:
                OnBoarding1(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .two:
                OnBoarding2(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .three:
                OnBoarding3(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .four:
                OnBoarding4(currentPage: $currentTab)
                    .transition(.move(edge: .trailing))
            case .five:
                OnBoarding5(show: $showOnboarding)
                    .transition(.move(edge: .trailing))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [Color(red: 0/255, green: 211/255, blue: 126/255), Color(red: 22/255, green: 24/255, blue: 30/255)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        )
        .animation(.bouncy(duration: 0.3), value: currentTab)
    }
}
