//
//  LocationManagerConfigurable.swift
//  OpenStreetAmenities
//
//  Created by Sam Khawase on 15.02.18.
//  Copyright © 2018 OpenStreetAmenities. All rights reserved.
//

protocol LocationManagerConfigurable {
    // wrap var delegate and desiredAccuracy to keep it platform agnostic
    func setDelegate(to instance: AnyObject)
    func setDesiredAccuracy(to accuracy: Double)
    func requestAlwaysAuthorization()
    func startUpdatingLocation()
}
