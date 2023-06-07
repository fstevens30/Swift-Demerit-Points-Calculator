//
//  ContentView.swift
//  Swift-Demerit-Points-Calculator
//
//  Created by Flynn Stevens on 7/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var drivingSpeed: String = ""
    @State private var speedLimit: String = ""
    @State private var holidayPeriod: Bool = false
    @State private var mandatoryPenalty: Bool = false
    @State private var penaltyPoints: Int = 0
    @State private var showErrorMessage: Bool = false
    
    var body: some View {
        VStack {
            
            Text("Demerit Points Calculator")
                .font(.title)
                .bold()
            
            HStack {
                TextField("Driving Speed", text: $drivingSpeed)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .bold()
                
                TextField("Speed Limit", text: $speedLimit)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .bold()
            }
            
            Toggle("Holiday Period", isOn: $holidayPeriod)
                .padding()
                .tint(.blue)
            
            HStack {
                
                Button("Calculate") {
                    calculateDemeritPoints()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .bold()
                
                Button("Reset") {
                    showErrorMessage = false
                    drivingSpeed = ""
                    speedLimit = ""
                    holidayPeriod = false
                }
                .padding()
                .buttonStyle(.bordered)
                .tint(.red)
                .bold()
            }
        }
        .padding()
        
            Group {
                if showErrorMessage {
                    MessageHandler(mandatoryPenalty: mandatoryPenalty, penaltyPoints: penaltyPoints, drivingSpeed: drivingSpeed, speedLimit: speedLimit)
                        .padding(.bottom)
                        .transition(.move(edge: .bottom))
                }
            }
            .padding()
    }
    
    private func calculateDemeritPoints() {
        guard let drivingSpeedValue = Double(drivingSpeed),
              let speedLimitValue = Int(speedLimit) else {
            showErrorMessage = false
            return
        }
        
        let result = getDemeritPoints(drivingSpeed: drivingSpeedValue, speedLimit: speedLimitValue, holidayPeriod: holidayPeriod)
        mandatoryPenalty = result.mandatoryPenalty
        penaltyPoints = result.penaltyPoints
        showErrorMessage = true
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
