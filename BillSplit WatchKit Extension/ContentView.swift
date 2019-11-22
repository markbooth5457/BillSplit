//
//  ContentView.swift
//  BillSplit WatchKit Extension
//
//  Created by Mark Booth on 19/11/2019.
//  Copyright © 2019 Mark Booth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 0]
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2.0
    @State private var tipPercentage = 0.0
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let orderAmount = Double(checkAmount)
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople )
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        VStack(alignment: .center, spacing: 13.0){
            HStack {
                Text("Bill")
                Spacer()
                Text("£\(checkAmount, specifier: "%g")")
            }
            .focusable(true)
            .digitalCrownRotation($checkAmount,
                                  from: 0,
                                  through: 2000,
                                  by: 1)
            
            HStack(alignment: .center) {
                Text("Tip")
                Spacer()
                Text("%\(tipPercentage, specifier: "%g")")
            }
            .focusable(true)
            .digitalCrownRotation($tipPercentage,
                                  from: 0.0,
                                  through: 20.0,
                                  by: 1)
            
            HStack {
                Text("Total")
                Spacer()
                Text("£\(grandTotal, specifier: "%.2f")")
            }
            HStack {
                Text("People # ")
                Spacer()
                Text("\(numberOfPeople, specifier: "%g")")
            }
            .focusable(true)
            .digitalCrownRotation($numberOfPeople,
                                  from: 2.0,
                                  through: 20.0,
                                  by: 1)
            
            HStack {
                Text("= \(totalPerPerson, specifier: "%.2f")")
                    .fontWeight(.bold)
                Spacer()
                Text("Each")
            }
        } .padding(.horizontal, 20.0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
