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
class PlacesViewModel: ObservableObject {
    
    let apiClient = APIClient()
    private let locationManager = CLLocationManager()
    
    init() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func fetchPlaces() {
        
    }
    
}
