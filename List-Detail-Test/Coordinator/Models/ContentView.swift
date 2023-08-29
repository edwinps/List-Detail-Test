//
//  ContentView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 26/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationModel = NavigationModel()
    @ObservedObject private var viewModel = MovieViewModel()
    
    var body: some View {
        MovieListView(viewModel: viewModel)
            .environmentObject(navigationModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

