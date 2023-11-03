//
//  ContentView.swift
//  UnitConvertor
//
//  Created by Nishant Vilkar on 03/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnitSelected = ""
    @State private var outputUnitSelected = ""
    @State private var valueToConvert: Double = 0.0
    
    
    let unitCategory = ["millimeters","centimeters","meters", "kilometers", "feet", "inches","yard", "miles"]
    
    var outputValue: Double {
        
        var conversion = valueToConvert
        
        switch inputUnitSelected {
        case "millimeters":
            conversion = conversion*1
        case "centimeters":
            conversion = conversion*10
        case "meters":
            conversion = conversion*1000
        case "kilometers":
            conversion = conversion*1000000
        case "feet":
            conversion = conversion*304.8
        case "inches":
            conversion = conversion*25.4
        case "yard":
            conversion = conversion*914.4
        case "miles":
            conversion = conversion*1609344
        default:
            break
        }
        
        switch outputUnitSelected {
        case "millimeters":
            conversion = conversion/1
        case "centimeters":
            conversion = conversion/10
        case "meters":
            conversion = conversion/1000
        case "kilometers":
            conversion = conversion/1000000
        case "feet":
            conversion = conversion/304.8
        case "inches":
            conversion = conversion/25.4
        case "yard":
            conversion = conversion/914.4
        case "miles":
            conversion = conversion/1609344
        default:
            break
        }
        
        return conversion
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Input") {
                    Picker("Input unit",
                           selection: $inputUnitSelected) {
                        ForEach(unitCategory, id: \.self) {
                            Text($0)
                        }
                    }
                           .pickerStyle(.navigationLink)
                }
                
                Section("Enter value to convert") {
                    TextField("Value",
                              value: $valueToConvert,
                              format: .number)
                    .keyboardType(.numberPad)
                }
                
                Section("OutPut") {
                    Picker("Output unit",
                           selection: $outputUnitSelected) {
                        ForEach(unitCategory, id: \.self) {
                            Text($0)
                        }
                    }
                           .pickerStyle(.navigationLink)
                }
                
                Section("Converted Value") {
                    Text(outputValue.formatted())
                        .foregroundStyle(.green)
                        .selectionDisabled(false)
                }
                
            }
            .navigationTitle("Length Convertor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
