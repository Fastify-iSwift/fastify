//
//  FastingViewModel.swift
//  Fastify
//
//  Created by Andira Yunita on 26/03/24.
//

import Foundation

enum FastingState {
    case notStarted
    case fasting
    case eating
}

class FastingViewModel: ObservableObject {
    @Published var fastingState: FastingState = .notStarted
    @Published var isElapsed = false
    @Published var elapsedTime: Double = 0.0
    @Published var progress: Double = 0.0
    @Published var startTime: Date {
        didSet {
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTime)
            } else {
                endTime = startTime.addingTimeInterval(eatingTime)
            }
        }
    }
    @Published var endTime: Date
    
    var fastingTime: Double {
//        return 16 * 3600 // 16 hours fasting
        return 16 // 16 seconds
    }
    
    var eatingTime: Double {
//        return (24 - 16) * 3600 // 8 hours eating
        return 24 - 16 // 8 seconds
    }
    
    init() {
        let calendar = Calendar.current
        let components = DateComponents(second: 0)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        
        startTime = scheduledTime
//        endTime = scheduledTime.addingTimeInterval(16 * 3600)
        endTime = scheduledTime.addingTimeInterval(16)
    }
    
    func fastingTrack() {
        guard fastingState != .notStarted else { return }
        
        if endTime >= Date() {
            isElapsed = false
        } else {
            isElapsed = true
        }
        elapsedTime += 1
        
        let totalTime = fastingState == .fasting ? fastingTime : eatingTime
        progress = (elapsedTime / totalTime * 100).rounded() / 100
    }
    
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .eating : .fasting
        startTime = Date()
        elapsedTime = 0.0
    }
}
