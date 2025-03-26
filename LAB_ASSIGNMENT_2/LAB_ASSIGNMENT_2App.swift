//
//  LAB_ASSIGNMENT_2App.swift
//  LAB_ASSIGNMENT_2
//
//  Created by Andrej Bachvarovski on 2025-03-26.
//

import SwiftUI

@main
struct LAB_ASSIGNMENT_2App: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        persistenceController.initializeDataIfNeeded()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
