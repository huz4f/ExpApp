//
//  YourExperienceApp.swift
//  YourExperience
//
//  Created by huz4f on 17/02/24.
//

import SwiftUI

@main
struct YourExperienceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
