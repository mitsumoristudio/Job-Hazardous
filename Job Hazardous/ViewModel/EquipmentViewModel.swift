//
//  EquipmentViewModel.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/27/24.
//

import Foundation
import CoreData
import SwiftUI

final class EquipmentViewModel: ObservableObject {
    let persistentContainer: NSPersistentContainer
    static let shared = EquipmentViewModel()
    @Published var savedEQEntities: [EquipmentEntity] = []
    
    init() {
        persistentContainer = NSPersistentContainer(name: "CoreData")
        persistentContainer.loadPersistentStores(completionHandler: {(description, error) in
            if let error = error {
                fatalError("Core Data Storage Failed \(error.localizedDescription)")
            }
        })
    }
    
    func addInEquipments(belts: String, cabWindows: String, coolerCores: String, def: String, defroster: String, diagnostic: String, engineCoolant: String,
                         engineOils: String, fireExtinguisher: String, frame: String, fuel: String, gauges: String, grabbars: String, harnessess: String, horn: String, hyraulicOils: String, inspectionDate: String, mirrors: String, operatorManual: String, overall: String, overallCleanliness: String, parkBrakes: String, seats: String, steering: String, tires: String, tranmissionOil: String, travelAlarms: String, undertheMachine: String, windShield: String, selectedProjects: String) {
        let newEntity = EquipmentEntity(context: persistentContainer.viewContext)
        newEntity.belts = belts
        newEntity.cabWindows = cabWindows
        newEntity.coolerCores = coolerCores
        newEntity.def = def
        newEntity.defroster = defroster
        newEntity.diagnostic = diagnostic
        newEntity.engineCoolant = engineCoolant
        newEntity.engineOils = engineOils
        newEntity.fireExtinguisher = fireExtinguisher
        newEntity.frame = frame
        newEntity.fuel = fuel
        newEntity.gauges = gauges
        newEntity.grabbars = grabbars
        newEntity.harnessses = harnessess
        newEntity.horn = horn
        newEntity.hydraulicOils = hyraulicOils
        newEntity.inspectionDate = inspectionDate
        newEntity.mirrors = mirrors
        newEntity.operatorManaul = operatorManual
        newEntity.overall = overall
        newEntity.overallCleanliness = overallCleanliness
        newEntity.parkBrakes = parkBrakes
        newEntity.seats = seats
        newEntity.steering = steering
        newEntity.tires = tires
        newEntity.transmissionOil = tranmissionOil
        newEntity.travelAlarms = travelAlarms
        newEntity.undertheMachine = undertheMachine
        newEntity.windshield = windShield
        newEntity.selectedProject = selectedProjects
        
        print(inspectionDate)
        print(selectedProjects)
        print(parkBrakes)
        
        saveEntity()
    }
    
    func fetchEntities() {
        let fetchRequest = NSFetchRequest<EquipmentEntity>(entityName: "EquipmentEntity")
        do {
            savedEQEntities = try persistentContainer.viewContext.fetch(fetchRequest)
        } catch let error {
            print("Error fetching information \(error)")
        }
    }
    
    func saveEntity() {
        do {
            try persistentContainer.viewContext.save()
        } catch let error {
            print("Error found while saving data \(error.localizedDescription)")
        }
        fetchEntities()
    }
    
    func deleteEntities(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEQEntities[index]
        persistentContainer.viewContext.delete(entity)
        
        saveEntity()
    }
}

