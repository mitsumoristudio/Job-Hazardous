//
//  ProjectCell.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import Foundation
import SwiftUI

struct ProjectCell: View {
    @State var projectName: String
    @State var projectNumber: String
    @State var projectDate: String
    @State var projectLocation: String
    @State var categoryColor: String
    
    private func getScreenRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("Job ID #: \(projectNumber)")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(Color.black).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .background {
                    Capsule()
                        .fill(.white.opacity(0.40))
                        .frame(minWidth: 180, minHeight: 36)
                    //  .frame(width: 160, height: 40)
                }
                .padding(.horizontal, 10)
            
            Text(projectName)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .lineLimit(3)
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Label {
                        Text(projectDate)
                    } icon: {
                        Image(systemName: "calendar")
                    }
                    .font(.headline)
                    .foregroundColor(.black).opacity(0.8)
                    .fontWeight(.light)
                    
                    Label {
                        Text(projectLocation)
                    } icon: {
                        Image(systemName: "map.circle")
                    }
                    .font(.headline)
                    .foregroundColor(.black).opacity(0.8)
                    .fontWeight(.light)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        //        .frame(width: 360, height: getScreenRect().height/4.0, alignment: .leading)
        
        .background {
            RoundedRectangle(cornerRadius: 12,style: .continuous)
                .fill(Color(categoryColor))
//            if categoryColor == categoryColor {
//                RoundedRectangle(cornerRadius: 12, style: .continuous)
//                    .fill(Color(categoryColor))
//            } else {
//                RoundedRectangle(cornerRadius: 12, style: .continuous)
//                    .fill(Color(.systemGray))
//            }
        }
    }
}

struct ProjectCell_Preview: PreviewProvider {
    static var previews: some View {
        let dummyProject = ProjectCell(projectName: "Project Pearl", projectNumber: "122200", projectDate: "June 21, 2024", projectLocation: "Nashville, TN", categoryColor: "")
        
        ProjectCell(projectName: dummyProject.projectName, projectNumber: dummyProject.projectNumber, projectDate: dummyProject.projectDate, projectLocation: dummyProject.projectLocation, categoryColor: "lightBlue")
    }
}


