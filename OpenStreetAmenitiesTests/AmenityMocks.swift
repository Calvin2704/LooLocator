//
//  AmenityMocks.swift
//  OpenStreetAmenitiesTests
//
//  Created by Sam Khawase on 16.02.18.
//  Copyright © 2018 OpenStreetAmenities. All rights reserved.
//

import Foundation

class MockAmenityRequest: AmenityRequest {
    override func getAmeneties(of type: AmenityType,
                               latitude: Double,
                               longitude: Double,
                               radius: Double,
                               completionBlock: @escaping CompletionBlock) {
        let dummyOSMData = [Location(id: "DummyLocation001", title: "Dummy Amenity", locationDescription: "Dummy Amenity Name", coordintes: (52.51631, 13.37777), isAccessible: false)]
        completionBlock(true, dummyOSMData as AnyObject)
    }
}
