//
//  ProjectListView.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import Foundation
import SwiftUI

struct ProjectListView: View {
    @EnvironmentObject var coreDataVM: ProjectViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                List {
                    ForEach(coreDataVM.savedEntities.sorted(by: { $0.projectDate ?? "" > $1.projectDate ?? "" }), id: \.self) { items in
                        
                        VStack {
                            ProjectCell(projectName: items.projectName ?? "", projectNumber: items.projectNumber ?? "", projectDate: items.projectDate ?? "", projectLocation: items.location ?? "", categoryColor: items.categoryColor ?? "lightBlack")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        coreDataVM.deleteEquipmentEntities(indexSet: indexSet)
                    })
                }
                // MARK: Add on Appear to fetch job info
                .onAppear {
                    coreDataVM.fetchEquipmentEntities()
                }
                
            }
            .navigationTitle("Ongoing Projects")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProjectListView_Preview: PreviewProvider {
    static var previews: some View {
        ProjectListView().environmentObject(ProjectViewModel())
    }
}
