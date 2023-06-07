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
                Text(mandatoryPenalty ? "Mandatory Penalty" : "Discretional Penalty")
                    .foregroundColor(.white)
                    .padding()
                Text("Penalty Points: \(penaltyPoints)")
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
        }
        .frame(width: 250, height: 100)
        .cornerRadius(10)
    }
}

struct messageHandler_Previews: PreviewProvider {
    static var previews: some View {
        MessageHandler(mandatoryPenalty: true, penaltyPoints: 10)
    }
}
