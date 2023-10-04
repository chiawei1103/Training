//
//  ContentView.swift
//  MapPractice
//
//  Created by Lawrence on 10/4/23.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Map {
                    Marker(coordinate: location) {
                        Text("current location")
                    }
                    Annotation("Coda", coordinate: CLLocationCoordinate2D(latitude: 33.77539884423955, longitude: -84.38765333186089)) {
                        VStack {
                            Text("Office")
                            Image(systemName: "building.2.crop.circle")
                        }
                        .foregroundColor(.blue)
                        .padding()
                        .background(in: .capsule)
                    }
                }
                
            }
            LocationButton {
                locationManager.requestLocation()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
