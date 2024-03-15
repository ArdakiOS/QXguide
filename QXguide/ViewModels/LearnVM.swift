//
//  LearnVM.swift
//  QXguide
//
//  Created by Ardak Tursunbayev on 10.03.2024.
//

import Foundation

class LearnVM : ObservableObject {
    @Published var learnArr : [LearnModel] = []
    @Published var currentLvl = UserDefaults.standard.object(forKey: "learnLvl") as? Int ?? 1
    
    init(){
        getArr()
    }
    
    func getArr() {
        if let currArr = UserDefaults.standard.object(forKey: "learnArr"){
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([LearnModel].self, from: currArr as! Data)
                learnArr = decodedData
            }
            catch{
                print("MYLOGG error in learnVM decoder")
            }
        }
        else{
            learnArr = [
                LearnModel(lvl: 1, name: "Fundamental Analysis", text: "Forex fundamental analysis is a type of market analysis that is performed based only on actual events and macroeconomic data related to the traded currencies. Fundamental analysis is used not only in Forex but can be a part of any financial planning or forecasting. The concepts that are part of fundamental analysis of currencies: overnight interest rates, central bank meetings and decisions, any macroeconomic news, global industrial, economic, political, and weather news. Fundamental analysis is the most natural way of making FX market forecasts. In theory, it alone should work perfectly but in practice, it is often used in pair with technical analysis.", passed: false),
                LearnModel(lvl: 2, name: "Technical Analysis", text: "Forex technical analysis is a type of market analysis that relies only on market data numbers - quotes, charts, simple and complex indicators, volume of supply and demand, past market data, etc. The main idea behind technical analysis of currencies is the postulate of functional dependence of the future market technical data on the past market technical data. Same as with fundamental analysis, technical analysis is believed to be self-sufficient and you can use it alone to trade Forex successfully. In practice, both analysis methods are used.", passed: false),
                LearnModel(lvl: 3, name: "Money Management", text: "Even if you master every possible method of market analysis and will make very accurate predictions for future Forex market behavior, you will not make any money without a proper money management strategy. Money management in Forex (as well as in other financial markets) is a complex set of rules that you develop to fit your own trading style and amount of capital you have for trading. Money management plays very important role in getting profits out of Forex; do not underestimate it.", passed: false),
                LearnModel(lvl: 4, name: "Trading Psychology", text: "While learning a lot about market analysis and money management is an obvious and necessary step to become a successful FX trader, you also need to master your emotions to keep your trading performance under strict control of mind and intuition. Controlling your emotions in Forex trading is often balancing between greed and fear. Almost any known psychological practices and techniques can help currency traders to follow their trading strategies rather than their spontaneous emotions. The problems you will have to deal with while being a professional Forex trader include:\nGreed\nOvertrading\nLack of discipline\nLack of confidence\nBlind following others' forecasts", passed: false),
                LearnModel(lvl: 5, name: "Forex Brokerage", text: "Every Forex trader, like any other professional, needs tools to trade. One of these tools, which is vital to be in the market, is a Forex broker and specifically for the Internet - an online Forex broker - a company which will provide real-time market information to traders and bring their orders to the Forex market.", passed: false)
            ]
            
            do{
                let coder = JSONEncoder()
                let codedData = try coder.encode(learnArr)
                UserDefaults.standard.setValue(codedData, forKey: "learnArr")
            }
            catch{
                print("MYLOGG error in learnVM Encoder")
            }
        }
    }
    
    func updateLvl(lvl : Int) {
        if currentLvl < lvl {
            currentLvl = lvl
            UserDefaults.standard.setValue(currentLvl, forKey: "learnLvl")
        }
        
    }
    
    func saveUpdatedArray() {
        do {
            let encoder = JSONEncoder()
            let codedData = try encoder.encode(learnArr)
            UserDefaults.standard.setValue(codedData, forKey: "learnArr")
        } catch {
            print("MYLOGG error in learnVM Encoder")
        }
    }
}
