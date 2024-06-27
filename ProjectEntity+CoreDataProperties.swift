//
//  ProjectEntity+CoreDataProperties.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/27/24.
//
//

import Foundation
import CoreData


extension ProjectEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectEntity> {
        return NSFetchRequest<ProjectEntity>(entityName: "ProjectEntity")
    }

    @NSManaged public var categoryColor: String?
    @NSManaged public var client: String?
    @NSManaged public var jobsiteDescription: String?
    @NSManaged public var location: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var projectDate: String?
    @NSManaged public var projectManager: String?
    @NSManaged public var projectName: String?
    @NSManaged public var projectNumber: String?
    @NSManaged public var superintendent: String?
  //  @NSManaged public var projectToEquipment: NSSet?
    @NSManaged public var projectToEquipment: Set<EquipmentEntity>?
    
    public var equipmentName: [EquipmentEntity] {
        let setofEquipment = projectToEquipment
        return setofEquipment!.sorted { $0.id > $1.id
            
        }
    }
}

// MARK: Generated accessors for projectToEquipment
extension ProjectEntity {

    @objc(addProjectToEquipmentObject:)
    @NSManaged public func addToProjectToEquipment(_ value: EquipmentEntity)

    @objc(removeProjectToEquipmentObject:)
    @NSManaged public func removeFromProjectToEquipment(_ value: EquipmentEntity)

    @objc(addProjectToEquipment:)
    @NSManaged public func addToProjectToEquipment(_ values: NSSet)

    @objc(removeProjectToEquipment:)
    @NSManaged public func removeFromProjectToEquipment(_ values: NSSet)

}

extension ProjectEntity : Identifiable {

}
