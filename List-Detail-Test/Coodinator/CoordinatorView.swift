//
//  CoordinatorView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coodinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coodinator.path) {
            buildListView()
                .navigationDestination(for: Page.self) { page in
                    buildDetailView()
                }
        }
        .environmentObject(coodinator)
    }
}

private extension CoordinatorView {
    @ViewBuilder
    func buildListView() -> some View {
        coodinator.build(page: .list)
    }
    
    @ViewBuilder
    func buildDetailView() -> some View {
        coodinator.build(page: .detail)
    }
}
