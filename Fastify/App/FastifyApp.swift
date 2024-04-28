//
//  FastifyApp.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 20/03/24.
//

import SwiftUI
import SwiftData

@main
struct FastifyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//       set up the container for the whole windowGroup scene.
//       all of these views will write and read from single container (this)
        .modelContainer(for: Fasting.self)
    }
}
