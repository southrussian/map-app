//
//  LocationsListView.swift
//  MapAppSouthRussian
//
//  Created by Danil Peregorodiev on 05.09.2023.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                
                Button {
                    viewModel.showNextLocation(location: location)
                } label: {
                    HStack {
                        if let imageName = location.imageNames.first {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(location.name)
                                    .bold()
                                Text(location.cityName)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                
                
            }
        }
        .listStyle(.plain)
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}
