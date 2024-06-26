//
//  InspectionView.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/25/24.
//

import Foundation
import SwiftUI

struct InspectionView: View {
 //   @State var equipments: PreEquipmentModel
    var backgroundGradient = Color(#colorLiteral(red: 0.7869432202, green: 0.8728674827, blue: 0.8820440269, alpha: 0.6454884106))
    @State var dateSelect: Date = Date()
    @State var showAlertIcon: Bool = false
    @State var isCompleted: Bool = false
    @State var equipmentName: String = ""
    var yesNoArray: Array = ["N/A", "YES", "NO"]
    var safeArray: Array = ["N/A", "Safe", "At Risk"]
    @Environment(\.dismiss) var dismiss
    
    @State var naSelectionOverall: String = "N/A"
    @State var naGrabbars: String = "N/A"
    @State var naFrame: String = "N/A"
    @State var naharnesses: String = "N/A"
    @State var natires: String = "N/A"
    @State var naundertheMachine: String = "N/A"
    @State var nabelts: String = "N/A"
    @State var naCoolerCores: String = "N/A"
    
    // MARK: Int the Operators Cab
    @State var naCabWindows: String = "N/A"
    @State var naoverallCleanliness: String = "N/A"
    @State var naoperatorManual: String = "N/A"
    @State var naSeats: String = "N/A"
    @State var naMirror: String = "N/A"
    @State var nawwindShield: String = "N/A"
    @State var nadefroster: String = "N/A"
    @State var nagauges: String = "N/A"
    @State var nafuel: String = "N/A"
    @State var nafireExtinguisher: String = "N/A"
    @State var nahorn: String = "N/A"
    @State var naparkBrakes: String = "N/A"
    @State var naSteering: String = "N/A"
    @State var natravelAlarm: String = "N/A"
    @State var naDiagnostic: String = "N/A"
    
    // MARK: Fluids
    @State var naEngineOils: String = "N/A"
    @State var nahydraulicOils: String = "N/A"
    @State var natransmissionOil: String = "N/A"
    @State var naengineCoolant: String = "N/A"
    @State var naDef: String = "N/A"
    var arrayProjects = ["Project Pearl", "Amazon", "Bojangles"]
    
    @EnvironmentObject var coreDateViewModel: ProjectViewModel
    @State private var selectedProjects = ProjectEntity()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    // MARK: Date Picker
                    HStack(alignment: .bottom, spacing: 20) {
                        HStack(spacing: 12) {
                            titleView("Date", color: .black)
                                .padding(.vertical, 10)
                                
                            
                            Text(dateSelect.toString("EEEE dd, MMMM"))
                                .font(.headline)
                            
                            Image(systemName: "calendar")
                                .font(.title2)
                                .foregroundColor(Color.blue).opacity(0.75)
                                .overlay {
                                    DatePicker("", selection: $dateSelect, displayedComponents: [.date])
                                        .blendMode(.destinationOver)
                                }
                        }
                        .offset(y: -5)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.black.opacity(0.8))
                                .frame(height: 1)
                                .offset(y: 5)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("Equipment:")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            TextField("Enter Equipment Name", text: $equipmentName)
                                .font(.headline)
                                .fontWeight(.medium)
                                .padding(.top, 2)
                                .modifier(TextFieldClearButton(nextText: $equipmentName))
                        }
                        Rectangle()
                            .fill(.black.opacity(0.5))
                            .frame(maxHeight: 1.2)
                        
                        HStack() {
                            
                            Text("Project:")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Picker("Select Project", selection: $selectedProjects) {
                                ForEach(coreDateViewModel.savedEntities.sorted(by: { $0.projectName ?? "" > $1.projectName ?? "" }), id: \.self) { items in
                                    Text(items.projectName ?? "")
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                         
                    .padding(.vertical, 10)
                    
                    .onAppear {
                        coreDateViewModel.fetchEquipmentEntities()
                    }
                }
                .padding(.horizontal)
                
                Group {
                    // MARK: Add Equipment Daily Inspection Here
                    preEquipmentCheckView()
      
                }
                
                VStack(spacing: 8) {
                    
                    Text("The Periodic Maintenance Checklist as outlined in the Operator's Manual has been completed and any necessary maintenance items have been addressed")
                        .fontWeight(.medium)
                        .font(.caption)
                    
                    Button(action: {
                        
                    }, label: {
                        buttonLabel(placeHolder: "Save")
                    })
                }
                .frame(minWidth: 220, minHeight: 60)
                .padding(.horizontal, 10)
     
            }
        //    .background(.thinMaterial)
            .background(backgroundGradient)
  
            .padding(.horizontal, 10)
            .navigationTitle("Equipment Pre-Inspection")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward.circle")
                        .foregroundColor(Color.white)
                        .background(Color.black, in: Circle())
                        .font(.title)
                })
            })
        }
        }
        
    }

struct InspectionView_Preview: PreviewProvider {
    static var previews: some View {
        InspectionView().environmentObject(ProjectViewModel())
     //   InspectionView(equipments: PreEquipmentModel(title: "Hydraulic Fluid", subject: "Hydraulic Fluid"))
    }
}

extension InspectionView {
    
    private func buttonLabel(placeHolder: String) -> some View {
        Text(placeHolder)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(width: 160, height: 46)
            .background(.indigo)
            .cornerRadius(12)
            .padding(.vertical, 5)
        
    }
    
    private func titleView(_ value: String, color: Color = .black.opacity(0.9)) -> some View {
        Text(value)
            .font(.system(size: 18))
            .foregroundStyle(color)
            .fontWeight(.semibold)
        
    }
}

extension InspectionView {
    @ViewBuilder
    func preEquipmentCheckView() -> some View {
        VStack() {
            List {
                VStack(alignment: .leading, spacing: 10) {
                    Text("From the Grounds")
                        .fontWeight(.medium)
                        .font(.headline)
                        .underline()
                    
                    HStack(spacing: 0) {
                        Text("Overall Machine Appearance")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naSelectionOverall, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Ropes, Grab Bars, Steps, Hand Holds")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naGrabbars, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Frame and Undercarriage")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naFrame, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Lights, Harnesses, Electrical Items")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naharnesses, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Tires, Rims, Wheel Locks/ Tracks")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $natires, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Under the Machine")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naundertheMachine, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Belts, Hoses, Hydraulic Cylinders")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nabelts, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Cooler Cores")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naCoolerCores, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Cab Windows")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naCabWindows, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Overall Cleansliness")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naoverallCleanliness, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Operation Manual Present")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naoperatorManual, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Seat, Seat Belt, Buckle, Mount")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naSeats, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Mirror and Rear View Camera")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naMirror, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("WindShield Wipers")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nawwindShield, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Defroster")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nadefroster, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Gauges, Indicator Lights, Switches")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nagauges, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Fuel")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nafuel, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Fire Extinguisher")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nafireExtinguisher, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Horns")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nahorn, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Brakes")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naparkBrakes, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Steering")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naSteering, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Travel & Backup Alarm")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $natravelAlarm, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Diagnostic Trouble Code")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naDiagnostic, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Engine Oil")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naEngineOils, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Hydraulic Oil")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $nahydraulicOils, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Transmission Oil")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $natransmissionOil, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Engine Coolant")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naengineCoolant, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                    HStack(spacing: 0) {
                        Text("Def")
                            .fontWeight(.medium)
                            .font(.subheadline)
                        
                        Picker("", selection: $naDef, content: {
                            ForEach(safeArray, id: \.self) { safety in
                                Text(safety)
                            }
                        })
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 16)
                    }
                    .frame(minWidth: 320, alignment: .bottomLeading)
                    Divider()
                    
                }
            }
        }
    }
}
