//
//  getDemeritPoints.swift
//  Swift-Demerit-Points-Calculator
//
//  Created by Flynn Stevens on 7/06/23.
//

import Foundation

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
