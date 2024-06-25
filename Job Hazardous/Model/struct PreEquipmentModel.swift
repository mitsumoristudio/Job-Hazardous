//
//  struct PreEquipmentModel.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/25/24.
//

import Foundation
import SwiftUI

struct PreEquipmentModel: Identifiable {
    
    var id: UUID?
    var title: String
    var subject: String
}

var equipmentCollections = [PreEquipmentModel(title: "Periodic Headlines", subject: "The Periodic Maintenance Checklist as outlined in the Operator's Manual has been completed and any necessary maintenance items have been addressed"), PreEquipmentModel(title: "Overall", subject: "Overall Machine Appearance"), PreEquipmentModel(title: "Grabbars", subject: "Ropes, Grab Bars, Steps, Hand Holds"), PreEquipmentModel(title: "Frame", subject: "Frame and Undercarriage"), PreEquipmentModel(title: "Harnesses", subject: "Lights, Harnesses, Electrical Items"), PreEquipmentModel(title: "Tires", subject: "Tires, Rims, Wheel Locks/ Tracks"), PreEquipmentModel(title: "Under the Machine", subject: "Under the Machine"), PreEquipmentModel(title: "Belts", subject: "Belts, Hoses, Hydraulic Cylinders"), PreEquipmentModel(title: "Cooler Cores", subject: "Cooler Cores"), PreEquipmentModel(title: "Cab Windows", subject: "Cab Windows"), PreEquipmentModel(title: "Overall Cleansliness", subject: "Overall Cleansliness"), PreEquipmentModel(title: "Operation Manual", subject: "Operations Manual Present"), PreEquipmentModel(title: "Seats", subject: "Seat, Seat Belt, Buckle, Mount"), PreEquipmentModel(title: "Mirror", subject: "Mirror and Rear View Camera"), PreEquipmentModel(title: "WindShield Wipers", subject: "WindShield Wipers"), PreEquipmentModel(title: "Defroster", subject: "Defroster"), PreEquipmentModel(title: "Gauges", subject: "Gauges, Indicator Lights, Switches"), PreEquipmentModel(title: "Fuel", subject: "Fuel"), PreEquipmentModel(title: "Fire Extinguisher", subject: "Fire Extinguisher"), PreEquipmentModel(title: "Horns", subject: "Horns"), PreEquipmentModel(title: "Brakes", subject: "Brakes"), PreEquipmentModel(title: "Steering", subject: "Steering & Secondary Steering"), PreEquipmentModel(title: "Alarm", subject: "Travel & Backup Alarm"), PreEquipmentModel(title: "Diagnostic", subject: "Diagnostic Trouble Code"), PreEquipmentModel(title: "Engine Oil", subject: "Engine Oil"), PreEquipmentModel(title: "Hydraulic Oil", subject: "Hydraulic Oil"), PreEquipmentModel(title: "Transmission Oil", subject: "Transmission Oil"), PreEquipmentModel(title: "Engine Coolant", subject: "Engine Coolant"), PreEquipmentModel(title: "Washer Fluids", subject: "Washer Fluids"), PreEquipmentModel(title: "Fuel Level", subject: "Fuel"), PreEquipmentModel(title: "DEF", subject: "Def") ]
    
