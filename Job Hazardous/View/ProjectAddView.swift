//
//  ProjectAddView.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import Foundation
import SwiftUI

struct ProjectAddView: View {
    
    var backgroundGradientlight =  Color(#colorLiteral(red: 0.3628445035, green: 0.8369211084, blue: 0.7693976097, alpha: 0.7386692881))
    @State var category: String = ""
    @State var description: String = ""
    @State var dateSelect: Date = .init()
    @State var projectName: String = ""
    @State var projectNumber: String = ""
    @State var projectManager: String = ""
   
    @State var superintendent: String = ""
    @State var client: String = ""
    @State var projectLocation: String = ""
    @Environment(\.dismiss) var dismiss
    @Binding var needtoRefresh: Bool
    @State var showImagePicker: Bool = false
    
    @EnvironmentObject var coreDataViewModel: ProjectViewModel
    @State var projectEntities: ProjectEntity
    
    private func getScreenReact() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func titleView(_ value: String, _ color: Color = .white.opacity(0.7)) -> some View {
        Text(value)
            .font(.system(size: 16, design: .rounded))
            .foregroundStyle(color)
            .fontWeight(.semibold)
    }
    
    var body: some View {
        NavigationStack {
            ZStack() {
                backgroundGradientlight
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        titleView("Project")
                        
                        TextField("Enter Project Name", text: $projectName)
                            .font(.headline)
                            .padding(.top, 2)
                            .foregroundColor(Color.white)
                            .modifier(TextFieldClearButton(nextText: $projectName))
                        
                        Rectangle()
                            .fill(.white.opacity(0.8))
                            .frame(height: 1)
                        
                        titleView("Project Number")
                        TextField("Enter Project Number", text: $projectNumber)
                            .font(.headline)
                            .padding(.top, 2)
                            .foregroundColor(Color.white)
                            .modifier(TextFieldClearButton(nextText: $projectNumber))
                        
                        Rectangle()
                            .fill(.white.opacity(0.8))
                            .frame(height: 1)
                        
                        titleView("Date") // MARK: Project Date Created
                        
                        HStack(alignment: .bottom, spacing: 12) {
                            HStack(spacing: 12) {
                                Text(dateSelect.toString("EEEE dd, MMMM"))
                                    .font(.subheadline)
                                
                                Image(systemName: "calendar")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .overlay {
                                        DatePicker("", selection: $dateSelect, displayedComponents: [.date])
                                            .blendMode(.destinationOver)
                                    }
                            }
                            .offset(y: -5)
                            .overlay(alignment: .bottom) {
                                Rectangle()
                                    .fill(.white.opacity(0.8))
                                    .frame(height: 1)
                                    .offset(y: 5)
                            }
                        }
                        .padding(.vertical, 10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            titleView("Project Manager")
                            TextField("Enter Project Manager", text: $projectManager)
                                .font(.headline)
                                .padding(.top, 2)
                                .foregroundColor(Color.white)
                                .modifier(TextFieldClearButton(nextText: $projectManager))
                            
                            Rectangle()
                                .fill(.white.opacity(0.8))
                                .frame(height: 1)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                titleView("Superintendent")
                                TextField("Enter Superintendent", text: $superintendent)
                                    .font(.headline)
                                    .padding(.top, 2)
                                    .foregroundColor(Color.white)
                                    .modifier(TextFieldClearButton(nextText: $superintendent))
                                
                                Rectangle()
                                    .fill(.white.opacity(0.8))
                                    .frame(height: 1)
                                
                                titleView("Location")
                                TextField("City, State", text: $projectLocation)
                                    .font(.headline)
                                    .padding(.top, 2)
                                    .foregroundColor(Color.white)
                                    .modifier(TextFieldClearButton(nextText: $projectLocation))
                                
                                Rectangle()
                                    .fill(.white.opacity(0.8))
                                    .frame(height: 1)
                                
                                titleView("Client")
                                TextField("Enter Client", text: $client)
                                    .font(.headline)
                                    .padding(.top, 2)
                                    .foregroundColor(Color.white)
                                    .modifier(TextFieldClearButton(nextText: $client))
                                
                                Rectangle()
                                    .fill(.white.opacity(0.8))
                                    .frame(height: 1)
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Details of Jobsite")
                                    .font(.headline)
                                    .padding(.top, 2)
                                    .foregroundColor(Color.white).opacity(0.8)
                                
                                HStack(spacing: 5) {
                                    TextEditor(text: $description)
                                        .frame(minWidth: 360, minHeight: 80)
                                        .cornerRadius(20)
                                        .padding(.vertical, 5)
                                     //   .modifier(TextFieldClearButton(nextText: $description))
                                 //       .modifier(ChangeSmallerFrameSize())
                                }
                                
                            }
                            .padding(.vertical, 10)
                            
                            VStack(spacing: 5) {
                                Button(action: {
                                    
                                    // MARK: add persistentContainer to save file
                                    // MARK: Use DateFormatter to convert Date to a string
                                    let timeNow = DateFormatter()
                                    timeNow.dateStyle = .full
                                    timeNow.timeStyle = .none
                                    let laterTimeNow = timeNow
                                    let dateOnlyFormat = laterTimeNow.string(from: dateSelect)
                                    
                                    coreDataViewModel.addEquipments(superintendent: superintendent, projectNumber: projectNumber, projectName: projectName, projectManager: projectManager, location: projectLocation, jobsiteDescription: description, jobDate: dateOnlyFormat, client: client)
                                    
                                    superintendent = ""
                                    projectNumber = ""
                                    projectName = ""
                                    projectManager = ""
                                    projectLocation = ""
                                    description = ""
                                    client = ""
                                    
                                }, label: {
                                    Text("Save")
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                        .padding()
                                        .frame(minWidth: 200, minHeight: 56)
                                        .foregroundStyle(.white)
                                       // .background(Color(#colorLiteral(red: 0.1923083849, green: 0.6083164035, blue: 0.2002578062, alpha: 1)))
                                        .background(Color(#colorLiteral(red: 0.08988218558, green: 0.4913719465, blue: 0.5871633619, alpha: 0.7386692881)))
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                        .shadow(radius: 20)
                                })
                                .offset(y: -18)
                                
                                .frame(minWidth: 60, minHeight: 56, alignment: .center)
                                .padding(.horizontal, 140)
                            }
                            .padding()
                            
                        }
   
                        
                        
                        
                        
                    }
                    // MARK: - frame height assigned with CGFloat
                    .frame(height: getScreenReact().height/1.2, alignment: .leading)
                    .padding()
                    
                }
            }
        }
    }
}

struct ProjectAddView_Preview: PreviewProvider {
    static var previews: some View {
        ProjectAddView(needtoRefresh: .constant(true), projectEntities: ProjectEntity())
            .environmentObject(ProjectViewModel())
    }
}


