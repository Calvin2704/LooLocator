//
//  OpenStreetAmenitiesTests.swift
//  OpenStreetAmenitiesTests
//
//  Created by Sam Khawase on 14.02.18.
//  Copyright © 2018 OpenStreetAmenities. All rights reserved.
//

import XCTest
import Quick
import Nimble
import CoreLocation
import OHHTTPStubs

@testable import OpenStreetAmenities

class LocationProviderTests: QuickSpec {
    override func spec() {
        describe("Given a LocationProvider") {
            context("When it's started with LocationManager", closure: {
                // Arrange
                let mockLocationManager = MockLocationManager()
                let mockLocationObservable = MockLocationObservable()
                let locationProvider: LocationProvidable = LocationProvider(locationManager: mockLocationManager)
                beforeEach {
                    mockLocationManager.callCount = 0
                }
                it("then starts location updates", closure: {
                    locationProvider.setListener(listener: mockLocationObservable)
                    // Act
                    locationProvider.startLocationUpdates()
                    //Assert
                    expect(mockLocationManager.callCount).toEventually(equal(4))
                    expect(mockLocationObservable.coordinates).toEventuallyNot(beNil())
                    expect(mockLocationObservable.coordinates?.0).toEventually(equal(52.51631))
                    expect(mockLocationObservable.coordinates?.1).toEventually(equal(13.37777))
                })
                
                it("then provides current location", closure: {
                    // Act
                    let (lat, lon) = locationProvider.getCurrentLocation()
                    //Assert
                    expect(lat).to(equal(52.51631))
                    expect(lon).to(equal(13.37777))
                })
            })
        }
    }
}
