//
//  LearnPage.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import SwiftUI

struct LearnPage: View {
    @State var showDetail = false
    @State var currentLesson = 0
    @StateObject var vm = LearnVM()
    @Binding var curPage : MainPages
    var body: some View {
        if showDetail{
            VStack(alignment: .center){
                HStack{
                    Text("Learn")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        showDetail = false
                    } label: {
                        Text("Back")
                    }
                    
                }
                .padding(.bottom, 30)
                
                Text(vm.learnArr[currentLesson].name)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Rectangle()
                    .frame(height: 0.5)
                
                Text(vm.learnArr[currentLesson].text)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                Spacer()
                
                Button {
                    if currentLesson < vm.learnArr.count - 1{
                        currentLesson += 1
                    }
                    else{
                        showDetail = false
                    }
                    vm.learnArr[currentLesson].passed = true
                    vm.updateLvl(lvl: vm.learnArr[currentLesson].lvl)
                } label: {
                    Text("Next Lesson")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .frame(width: 343, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("ActiveTab"))
                        )
                }
                .padding(.bottom, 15)

            }
            .frame(width: 343)
            .foregroundColor(.white)
        }
        else{
            VStack(alignment: .leading){
                HStack{
                    Text("Learn")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)){
                            curPage = .main
                        }
                    } label: {
                        Text("Back")
                    }
                    
                }
                .padding(.bottom, 30)
                
                Text("We offer you 5 basic lessons, starting with them, you will gain new knowledge and become closer to understanding the forex market")
                
                HStack{
                    ZStack(alignment:.leading){
                        RoundedRectangle(cornerRadius: 4)
                            .frame(height: 6)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.green)
                            .frame(width: 312 * Double(vm.currentLvl)/5, height: 6)
                        
                        
                    }
                    .frame(width: 312)
                    
                    Text("\(vm.currentLvl)/5")
                        .font(.system(size: 14))
                }
                
                ForEach(vm.learnArr.indices, id: \.self){row in
                    Button {
                        vm.learnArr[row].passed = true
                        vm.updateLvl(lvl: vm.learnArr[row].lvl)
                        currentLesson = row
                        showDetail = true
                    } label: {
                        LearnRow(row: vm.learnArr[row], currentLvl: vm.currentLvl)
                    }
                    .disabled(vm.learnArr[row].lvl > vm.currentLvl)
                    
                    
                }
                
                
            }
            .onAppear{
                vm.saveUpdatedArray()
            }
            .frame(width: 343)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    NavView(currentPage: .home)
}
