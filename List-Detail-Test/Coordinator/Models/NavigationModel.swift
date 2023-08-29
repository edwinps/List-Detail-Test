//
//  NavigationModel.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 26/8/23.
//

import SwiftUI

enum Page: String, Identifiable {
    case list
    case detail
    var id: String {
        self.rawValue
    }
}

final class NavigationModel: ObservableObject {
    @Published var path: [Page]
    
    init(path: [Page] = []) {
        self.path = path
    }
}
