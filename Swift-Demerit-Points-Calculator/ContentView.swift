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
        ScrollView {
            
            Text("Demerit Points Calculator")
                .font(.title)
            
            HStack {
                TextField("Driving Speed", text: $drivingSpeed)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                
                TextField("Speed Limit", text: $speedLimit)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(.roundedBorder)
            }
            
            Toggle("Holiday Period", isOn: $holidayPeriod)
                .padding()
            
            Button("Calculate") {
                calculateDemeritPoints()
            }
            .padding()
            .buttonStyle(.borderedProminent)
            
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

func getDemeritPoints(drivingSpeed: Double, speedLimit: Int, holidayPeriod: Bool = false) -> (mandatoryPenalty: Bool, penaltyPoints: Int) {
    let speedDiff = drivingSpeed - Double(speedLimit)
    
    if drivingSpeed <= Double(speedLimit) {
        return (false, 0)
    }
    
    if holidayPeriod {
        if speedDiff <= 4 {
            return (false, 10)
        } else if speedDiff <= 10 {
            return (true, 10)
        } else if speedDiff <= 20 {
            return (true, 20)
        } else if speedDiff <= 30 {
            return (true, 30)
        } else {
            return (true, 50)
        }
    } else {
        if speedDiff <= 5 {
            return (false, 10)
        } else if speedDiff <= 10 {
            return (true, 10)
        } else if speedDiff <= 20 {
            return (true, 20)
        } else if speedDiff <= 30 {
            return (true, 30)
        } else {
            return (true, 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
