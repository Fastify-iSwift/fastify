//
//  PreviewSampleData.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 26/04/24.
//

import SwiftUI
import SwiftData

@MainActor
var previewContainer: ModelContainer {
    do {
        let container = try ModelContainer(
            for: Fasting.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
        for fasting in Fasting.dummy {
            container.mainContext.insert(
                fasting
            )
        }
        return container
    } catch {
        fatalError(
            "Failed to create container"
        )
    }
}
