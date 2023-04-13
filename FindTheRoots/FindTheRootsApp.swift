//
//  FindTheRootsApp.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import Blackbird
import SwiftUI

@main
struct FindTheRootsApp: App {
    var body: some Scene {
        WindowGroup {
            RootsCalculatorView()
                .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
