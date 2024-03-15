//
//  NavView.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

enum NavTabs : String, CaseIterable {
    case home = "Main"
    case signals = "Signals"
    case settings = "Settings"
}

struct NavView: View {
    @State var showOnboarding = UserDefaults.standard.object(forKey: "showOnb")as? Bool ?? true
    @State var currentPage = NavTabs.home
    
    @StateObject var sigVM = SignalsVM()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        if !showOnboarding{
            AllOnboardingViews(showOnboarding: $showOnboarding)
        }
        else{
            ZStack{
                Color("MainBg").ignoresSafeArea()
                VStack{
                    switch currentPage {
                    case .home:
                        HomePage()
                    case .signals:
                        SignalsPage(sigVM: sigVM)
                            .onAppear{
                                sigVM.addSignal()
                            }
                    case .settings:
                        SettingsPage()
                    }
                    Spacer()
                    NavTabBar(selectedTab: $currentPage)
                }
            }
            .onReceive(timer, perform: { _ in
                for index in (0..<sigVM.signals.count).reversed() {
                    sigVM.signals[index].remainingTime -= 1
                    if sigVM.signals[index].remainingTime < 0 {
                        sigVM.signals.remove(at: index)
                    }
                }
            })
        }
    }
    
}

#Preview {
    NavView()
}
