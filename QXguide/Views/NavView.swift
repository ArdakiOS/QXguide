//
//  NavView.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

enum NavTabs : String, CaseIterable {
    case home = "Main"
    case study = "Learn"
    case signals = "Signals"
    case settings = "Settings"
    
}

struct NavView: View {
    @State var showOnboarding = UserDefaults.standard.object(forKey: "showOnb")as? Bool ?? true
    @State var currentPage = NavTabs.home
    
    @StateObject var sigVM = SignalsVM()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        if showOnboarding{
            AllOnboardingViews(showOnboarding: $showOnboarding)
        }
        else{
            ZStack{
                Color(red: 22/255, green: 26/255, blue: 33/255).ignoresSafeArea()
                VStack{
                    switch currentPage {
                    case .home:
                        HomePage()
                    case .study:
                        StudyPage()
                    case .signals:
                        SignalsPage(sigVM: sigVM)
                            .onAppear{
                                if sigVM.signals.isEmpty{
                                    sigVM.addSignal()
                                }
                            }
                    case .settings:
                        SettingsPage()
                    }
                    Spacer()
                    NavTabBar(selectedTab: $currentPage)
                }
            }
            
        }
    }
    
}

#Preview {
    NavView()
}
