//
//  TimeIntervalUtil.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 07/04/24.
//

import Foundation

extension TimeInterval {
    func formattedTimeFull() -> (String, String, String) {
        let hours = Int(self) / 3600
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return (String(format: "%02d", hours),
                String(format: "%02d", minutes),
                String(format: "%02d", seconds))
    }
}
