//
//  NetworkRequest.swift
//  OpenStreetAmenities
//
//  Created by Sam Khawase on 15.02.18.
//  Copyright © 2018 OpenStreetAmenities. All rights reserved.
//
import Foundation

typealias CompletionBlock = (_ success: Bool, _ object: AnyObject?) -> ()

protocol NetworkRequestProviding {
    
    // The model that the request deals with
    associatedtype SerializedType : Codable
    
    // the function that performs the network request
    //func performNetworkRequest(completion: @escaping CompletionBlock)
    
    // CRUD interface
    func get(request: NSMutableURLRequest, completion: @escaping CompletionBlock)
    func post(request: NSMutableURLRequest, completion: @escaping CompletionBlock)
    func put(request: NSMutableURLRequest, completion: @escaping CompletionBlock)
    func delete(request: NSMutableURLRequest, completion: @escaping CompletionBlock)
    
    // Internal workhorse function: implemented in default extension
    func dataTask(request: NSMutableURLRequest, completion: @escaping CompletionBlock)
    
    // The implementor needs to implement this to provide the ApiResource that the request needs
    func createURLRequest<T: ApiResourceProviding>(from resource: T) -> NSMutableURLRequest?
}


