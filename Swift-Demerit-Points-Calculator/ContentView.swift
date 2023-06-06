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
    
    var body: some View {
        VStack {
            
            TextField("Driving Speed", text: $drivingSpeed)
                .padding()
            
            TextField("Speed Limit", text: $speedLimit)
                .padding()
            
            Toggle("Holiday Period", isOn: $holidayPeriod)
                .padding()
            
            Button("Calculate") {
                calculateDemeritPoints()
            }
            .padding()
            
            Text("Mandatory Penalty: \(mandatoryPenalty ? "True" : "False")")
            Text("Penalty Points: \(penaltyPoints)")
        }
        .padding()
    }
    
    private func calculateDemeritPoints() {
        guard let drivingSpeedValue = Double(drivingSpeed),
              let speedLimitValue = Int(speedLimit) else {
            return // What to return here?
        }
        
        let result = getDemeritPoints(drivingSpeed: drivingSpeedValue, speedLimit: speedLimitValue, holidayPeriod: holidayPeriod)
        mandatoryPenalty = result.mandatoryPenalty
        penaltyPoints = result.penaltyPoints
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
