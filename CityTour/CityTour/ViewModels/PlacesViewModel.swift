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
    private let currentLocation: CLLocation?
    @Published var selectedKeyword: Keyword = .cafe
    @Published var places: [PlaceRowModel] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func changeKeyword(to keyword: Keyword) async {
        await apiClient.getPlaces(forKeyword: keyword.apiName, location: currentLocation)
    }
    
    func fetchPlaces(location: CLLocation) async {
        print("DEBUG: latitude \(location.coordinate.latitude), longitude \(location.coordinate.longitude)")
        let result = await apiClient.getPlaces(forKeyword: "Coffee", location: location)
        
        switch result {
        case .success(let placesResponseModel):
            let places = placesResponseModel.results
            self.places = places.compactMap({ PlaceRowModel(place: $0) })
        case .failure(let placesError):
            break
        }
    }
    
}

extension PlacesViewModel: CLLocationManagerDelegate {
    
    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location error: \(error.localizedDescription)")
    }
    
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
    
    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        Task { @MainActor in
            await fetchPlaces(location: location)
        }
    }
}
