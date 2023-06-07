//
//  messageHandler.swift
//  Swift-Demerit-Points-Calculator
//
//  Created by Flynn Stevens on 7/06/23.
//

import SwiftUI

struct MessageHandler: View {
    var mandatoryPenalty: Bool
    var penaltyPoints: Int
    var drivingSpeed: String
    var speedLimit: String
    
    var body: some View {
        ZStack {
            if mandatoryPenalty {
                Color.red
            } else if penaltyPoints != 0 {
                Color.orange
            }
            else {
                Color.green
            }
            
            VStack {
                if penaltyPoints != 0 {
                    Text("The \(mandatoryPenalty ? "Mandatory" : "Discretional") penalty for driving \(drivingSpeed)km/h in a \(speedLimit)km/h zone is \(penaltyPoints) points.")
                        .foregroundColor(.white)
                        .bold()
                } else {
                    Text("You are not required to pay a penalty for driving \(drivingSpeed)km/h in a \(speedLimit)km/h zone.")
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
        .frame(height: 100)
        .cornerRadius(10)
    }
}

struct messageHandler_Previews: PreviewProvider {
    static var previews: some View {
        MessageHandler(mandatoryPenalty: true, penaltyPoints: 10, drivingSpeed: "30", speedLimit: "30")
    }
}
