//
//  Fasting.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 26/04/24.
//

import Foundation
import SwiftData

@Model
class Fasting: Identifiable, Hashable {
    let id = UUID()
    var startAt: Date
    var endAt: Date
    var createdAt: Date
    var updatedAt: Date
    
    init(startAt: Date, endAt: Date, createdAt: Date = .now, updatedAt: Date = .now) {
        self.startAt = startAt
        self.endAt = endAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Fasting {
    static var dummy: [Fasting] = [
        Fasting(startAt: .now, endAt: .now),
        Fasting(startAt: .now + 1, endAt: .now + 1),
        Fasting(startAt: .now + 2, endAt: .now + 2),
    ]
}
