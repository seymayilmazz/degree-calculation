//
//  ContentView.swift
//  WorldTraveler
//
//  Created by Şeyma Yılmaz on 1.01.2021.
//
//  degree calculation

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    
    let numberFormatter: NumberFormatter = {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelcius() -> String {
        
        if let value = Double(fahrenheitValue){
            let fahreneit =  Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            let celciusValue = fahreneit.converted(to: .celsius)
            return numberFormatter.string(from:NSNumber (value: celciusValue.value)) ?? "???"
        }else {
            return "please do not enter string value"
        }
    }
    
    var body: some View {
        VStack{
            TextField("value", text: $fahrenheitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
            Text("fahrenheit")
            Text("is actually").foregroundColor(.gray)
            Text(convertToCelcius())
            Text("degrees Celcius")
            Spacer()
        }
        .foregroundColor(.orange)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
