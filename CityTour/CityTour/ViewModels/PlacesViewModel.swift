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
    private var currentLocation: CLLocation?
    @Published var isLoading: Bool = false
    @Published var selectedKeyword: Keyword = .cafe
    @Published var places: [PlaceRowModel] = []
    @Published var alertTitle: String?
    @Published var alertMessage: String?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func changeKeyword(to keyword: Keyword) async {
        // Ensure current location exits FIRST
        guard let currentLocation = currentLocation else { return }
        if selectedKeyword == keyword {
            return
        } else {
            selectedKeyword = keyword
        }
        isLoading = true
        let result = await apiClient.getPlaces(forKeyword: keyword.apiName, location: currentLocation)
        isLoading = false
        parseAPI(result: result)
    }
    
    func fetchPlaces(location: CLLocation) async {
        print("DEBUG: latitude \(location.coordinate.latitude), longitude \(location.coordinate.longitude)")
        
        isLoading = true
        let result = await apiClient.getPlaces(forKeyword: selectedKeyword.apiName, location: location)
        isLoading = false
        parseAPI(result: result)
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
            self.currentLocation = location
            await changeKeyword(to: self.selectedKeyword)
        }
    }
    
    func parseAPI(result: APIClient.PlacesResult) {
        switch result {
        case .success(let placesResponseModel):
            let places = placesResponseModel.results
            self.places = places.compactMap({ PlaceRowModel(place: $0) })
        case .failure(let placesError):
            switch placesError {
            case .invalidURL, .invalidResponse, .badRequestError:
                alertTitle = "Something gone wrong"
                alertMessage = "Please try again"
            case .serverError:
                alertTitle = "Something gone wrong"
                alertMessage = "Pls check your internet connection"
            }
        
        }
    }
}
