//
//  NaturalLanguageDateInputView.swift
//  Natural Language Date Parser
//
//  Created by Zac Cohan on 26/3/2023.
//

import SwiftUI
import SoulverCore

struct DateInputView: View {
    
    @State private var inputDateText = ""
    @State private var selectedDate = Date()

    var body: some View {

        ScrollView {
            VStack() {
                HStack() {
                    Spacer()
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                    Spacer()
                }.padding()
                
                Text("Detected date: \(dateFormatter.string(from: selectedDate))")
                
                TextField("Enter a date in natural language", text: $inputDateText, onCommit: parseInputDate)
                    .textFieldStyle(.roundedBorder)
                    .padding([.bottom, .horizontal])
                
                VStack(spacing: 5.0) {
                    Text("Examples to try").bold()
                    Text("Jul30").textSelection(.enabled)
                    Text("12/2 4p").textSelection(.enabled)
                    Text("next thu").textSelection(.enabled)
                    Text("march 12 + 4 weeks 3 days").textSelection(.enabled)
                    Text("3 weeks from tomorrow").textSelection(.enabled)
                    Text("the party will be on July 4th").textSelection(.enabled)
                }
            }
        }
        .navigationTitle("Natural Language Date Parsing with SoulverCore")
        
     }

    private func parseInputDate() {
        
        if let date = inputDateText.dateValue {
            selectedDate = date
        }
        else {
            print("No date found")
        }
        
    }
    
    private func getDatestampType() {
        
        var engineCustomization = EngineCustomization.standard
        
        engineCustomization.featureFlags.seeksFutureDate = true
        
        let calculator = Calculator(customization: engineCustomization)
            
        if let datestampType = calculator.dateFor(inputDateText)?.result.evaluationResult.datestampValue?.type {
            print("Date of type \(datestampType)")
        }
        
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
}
