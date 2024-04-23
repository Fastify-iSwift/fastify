//
//  DateUtil.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 07/04/24.
//

import Foundation

extension Date {
    func formattedTime() -> String {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone.current
        return df.string(from: self)
    }
}
