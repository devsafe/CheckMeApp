//
//  ContentView.swift
//  CheckMeApp
//
//  Created by Сахар Кубический on 07.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Crow")) {
                    TextField("Amount $", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much you pay for service?")) {
                    Picker("Pick percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result")) {
                    Text("\(totalPerPerson, specifier: "%.2f") $")
                }
            }.navigationBarTitle("Check Me", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
