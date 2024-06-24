//
//  ProjectCard.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/24/24.
//

import SwiftUI

struct ProjectCard: View {
    @ObservedObject var projects: ProjectEntity
    
    var body: some View {
        VStack() {
            if (projects.profileImage != nil) {
                Image(uiImage: UIImage(data: projects.profileImage!)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 220, alignment: .top)
                    .overlay(alignment: .bottom) {
                        Text(projects.projectName ?? "")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .shadow(color: .black, radius: 10, x: 0, y:0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
        }
    }
}
