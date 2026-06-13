//
//  PlacesViewModel.swift
//  CityTour
//
//  Created by chuonpiseth on 13/6/26.
//

import Foundation
import CoreLocation

// 1. Import core location
// 2. Create a location manager
// 3. Request permission
// 4. Start getting location updates
// 5. Receive the location

@MainActor
class PlacesViewModel: NSObject, ObservableObject {
    
    private let apiClient = APIClient()
    private let locationManager = CLLocationManager()
    
    override init() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchPlaces() {
        
    }
    
}

extension PlacesViewModel: CLLocationManagerDelegate {
    nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            Task { @MainActor in
                locationManager.requestLocation()
            }
        default:
            break
        }
    }
}
