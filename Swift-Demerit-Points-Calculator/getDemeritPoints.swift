//
//  getDemeritPoints.swift
//  Swift-Demerit-Points-Calculator
//
//  Created by Flynn Stevens on 7/06/23.
//

import Foundation

func getDemeritPoints(drivingSpeed: Double, speedLimit: Int, holidayPeriod: Bool = false) -> (mandatoryPenalty: Bool, penaltyPoints: Int) {
    let speedDiff = drivingSpeed - Double(speedLimit)
    
    switch (drivingSpeed <= Double(speedLimit), holidayPeriod, speedDiff) {
    case (true, _, _):
        return (false, 0)

    case (_, true, let diff) where diff <= 4:
        return (false, 10)
    case (_, true, let diff) where diff <= 10:
        return (true, 10)
    case (_, true, let diff) where diff <= 20:
        return (true, 20)
    case (_, true, let diff) where diff <= 30:
        return (true, 30)
    case (_, true, _):
        return (true, 50)

    case (_, false, let diff) where diff <= 5:
        return (false, 10)
    case (_, false, let diff) where diff <= 10:
        return (true, 10)
    case (_, false, let diff) where diff <= 20:
        return (true, 20)
    case (_, false, let diff) where diff <= 30:
        return (true, 30)
    case (_, false, _):
        return (true, 50)
    }
}
