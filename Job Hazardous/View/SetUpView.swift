//
//  SetUpView.swift
//  Job Hazardous
//
//  Created by Satoshi Mitsumori on 6/21/24.
//

import Foundation
import SwiftUI

struct SetUpView: View {
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Setup")
            }
        }
        .navigationTitle("Setup")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SetUp_Preview: PreviewProvider {
    static var previews: some View {
        SetUpView()
    }
}


