//
//  ProjectViewModel.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import Foundation
import SwiftUI
import CoreData

final class ProjectViewModel: ObservableObject {
    let persistentContainer: NSPersistentContainer
    let dateFormatter = DateFormatter()
    
    @Published var savedEntities: [ProjectEntity] = []
    @Published var editEntity: ProjectEntity?
    
    init() {
        persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores(completionHandler: {(description, error) in
            if let error = error {
              //  print("Core Data Storage Error \(error.localizedDescription)")
                fatalError("Core Date Storage Failed \(error.localizedDescription)")
            }
        })
    }
    
    func addEquipments(superintendent: String, projectNumber: String, projectName: String, projectManager: String, location: String, jobsiteDescription: String, jobDate: String, client: String) {
        let newEntity = ProjectEntity(context: persistentContainer.viewContext)
        newEntity.superintendent = superintendent
        newEntity.projectNumber = projectNumber
        newEntity.projectName = projectName
        newEntity.projectManager = projectManager
        newEntity.location = location
        newEntity.jobsiteDescription = jobsiteDescription
        newEntity.projectDate = jobDate
        newEntity.client = client
        
        print(projectName)
        print(projectNumber)
        print(jobDate)
        
        saveEquipmentEntities()
    }
    
    func deleteEquipmentEntities(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        persistentContainer.viewContext.delete(entity)
        
        saveEquipmentEntities()
    }
    
    func fetchEquipmentEntities() {
        let fetchRequest = NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
        
        do {
            savedEntities = try persistentContainer.viewContext.fetch(fetchRequest)
            
        } catch let error {
            print("Error fetching information \(error)")
        }
    }
    
    func saveEquipmentEntities() {
        do {
            try persistentContainer.viewContext.save()
            
        } catch let error {
            print("Error found while saving data \(error.localizedDescription)")
        }
        
        fetchEquipmentEntities()
    }
}