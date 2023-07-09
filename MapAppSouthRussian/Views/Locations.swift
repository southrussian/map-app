//
//  Locations.swift
//  MapAppSouthRussian
//
//  Created by Danil Peregorodiev on 09.07.2023.
//

import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}

struct Locations: View {
    @StateObject private var viewModel = LocationsViewModel()
    var body: some View {
        List {
            ForEach(viewModel.locations) {
                
            }
        }
    }
}

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations()
    }
}
