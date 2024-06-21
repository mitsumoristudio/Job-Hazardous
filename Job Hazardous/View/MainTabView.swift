//
//  MainTabView.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        VStack(spacing: 5) {
            TabView {
                ProjectListView()
                    .environmentObject(ProjectViewModel())
                    .tabItem {
                        VStack() {
                            Image(systemName: "list.bullet.circle")
                            Text("List")
                        }
                    }
                    .tag(0)
                
                ProjectAddView(needtoRefresh: .constant(true), projectEntities: ProjectEntity())
                    .environmentObject(ProjectViewModel())
                    .tabItem {
                        VStack() {
                            Image(systemName: "plus.rectangle.on.folder.fill")
                            
                            Text("Add Project")
                        }
                    }
                    .tag(1)
                
                SetUpView()
                    .tabItem {
                        VStack() {
                            Image(systemName: "gearshape.fill")
                            Text("Settings")
                        }
                    }
                    .tag(2)
            }
        }
    }
}

struct MainTabView_Preview: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

