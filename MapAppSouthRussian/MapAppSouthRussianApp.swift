//
//  MapAppSouthRussianApp.swift
//  MapAppSouthRussian
//
//  Created by Danil Peregorodiev on 08.07.2023.
//

import SwiftUI

@main
struct MapAppSouthRussianApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
