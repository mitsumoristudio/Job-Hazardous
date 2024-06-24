//
//  ProjectDetailCard.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/24/24.
//

import SwiftUI

struct ProjectDetailCard: View {
    @State  var projectName: String
    @State  var projectNumber: String
    @State  var projectLocation: String
    @State  var projectManager: String
    @State  var superintendent: String
    @State  var client: String
    @State  var projectdetails: String
    
    @State var projectImage: Data?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    if projectImage != nil {
                        Image(uiImage: UIImage(data: projectImage!)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 330, minHeight: 330)
                            .shadow(radius: 5)
                    } else {
                        Image("DailyReportLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 330, minHeight: 330)
                            .shadow(radius: 5)
                    }
                    // MARK: Add projectHeadlines here
                    Text(projectName)
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.black)
                    
                    Text("Project Number: \(projectNumber)")
                        .font(.headline)
                        .fontWeight(.black)
                    
                    Text("Location: \(projectLocation)")
                        .font(.subheadline)
                        .fontWeight(.black)
                        .padding(.bottom, 10)
                    
                    Text("Project Manager: \(projectManager)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    Text("Superintedent: \(superintendent)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    Text("Client: \(client)")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    Text("Project Details")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                    
                    Text(projectdetails)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

extension ProjectDetailCard {
    func projectHeadlines() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(projectName)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.black)
            
            Text("Project Number: \(projectNumber)")
                .font(.headline)
                .fontWeight(.black)
            
            Text("Location: \(projectLocation)")
                .font(.subheadline)
                .fontWeight(.black)
                .padding(.bottom, 10)
            
            Text("Project Manager: \(projectManager)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Superintedent: \(superintendent)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Client: \(client)")
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("Project Details")
                .font(.subheadline)
                .fontWeight(.heavy)
            
            Text("\(projectdetails)")
                .font(.subheadline)
                .fontWeight(.medium)
            
        }
        
    }
}
