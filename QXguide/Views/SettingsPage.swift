//
//  SettingsPage.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Settings")
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            Button {
                //
            } label: {
                HStack{
                    Image("priv")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Privacy Policy")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .frame(width: 343, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("TabRow"))
                )
            }
            
            Button {
                //
            } label: {
                HStack{
                    Image("sup")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("Support")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .frame(width: 343, height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("TabRow"))
                )
            }

        }
        .foregroundColor(.white)
    }
}

#Preview {
    NavView(currentPage: .settings)
}
