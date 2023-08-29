//
//  CoordinatorView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coodinator = CoordinatorViewModel()
    
    var body: some View {
        NavigationStack(path: $coodinator.path) {
            coodinator.buildView(for: .list)
                .navigationDestination(for: Destination.self) { destination in
                    coodinator.buildView(for: destination)
                }
        }
        .environmentObject(coodinator)
    }
}
