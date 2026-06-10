//
//  PlaceResponseModel.swift
//  CityTour
//
//  Created by chuonpiseth on 11/6/26.
//

import Foundation

struct PlaceResponseModel: Decodable {
    let results: [PlaceDetailResponseModel]
}

struct PlaceDetailResponseModel: Decodable {
    let name: String
    let rating: Double
    let vicinity: String
//    let photos: [PhotoResponseModel]
}
