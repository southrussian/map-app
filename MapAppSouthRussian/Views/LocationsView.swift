//
//  Locations.swift
//  MapAppSouthRussian
//
//  Created by Danil Peregorodiev on 09.07.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
//    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                VStack {
                    Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.primary)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .overlay(alignment: .leading) {
                            if !viewModel.showLocationsList {
                                Image(systemName: "arrow.down")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            viewModel.showLocationsList.toggle()

                                        }
                                    }
                            } else {
                                Image(systemName: "arrow.up")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            viewModel.showLocationsList.toggle()

                                        }
                                    }
                            }
                            
                        }
                    if viewModel.showLocationsList {
                        LocationsListView()
                            .listRowBackground(Color.clear)
                    }
                    

                }
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
                .padding()
                                
                Spacer()
            }
            
        }
        
    }
}

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
