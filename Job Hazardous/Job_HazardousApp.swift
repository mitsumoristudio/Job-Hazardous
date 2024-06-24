//
//  Job_HazardousApp.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import SwiftUI

@main
struct Job_HazardousApp: App {
    let persistenceContainer = ProjectViewModel.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.persistentContainer.viewContext)
        }
        .onChange(of: scenePhase) { _, _ in
            persistenceContainer.savedEntities
        }
    }
}
