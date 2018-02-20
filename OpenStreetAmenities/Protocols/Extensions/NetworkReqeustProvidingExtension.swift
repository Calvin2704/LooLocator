//
//  NetworkReqeustProvidingExtension.swift
//  OpenStreetAmenities
//
//  Created by Sam Khawase on 15.02.18.
//  Copyright © 2018 OpenStreetAmenities. All rights reserved.
//

import Foundation

extension NetworkRequestProviding {
    internal var baseUrl: String {
        let _baseUrl = "https://overpass-api.de/api/interpreter"
        return _baseUrl
    }
    
    func dataTask(request: NSMutableURLRequest, completion: @escaping (Bool, AnyObject?) -> ()) {
        //request.httpMethod = request.httpMethod
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            let decoder = JSONDecoder()
            if let data = data,
                let serverResponse = try? decoder.decode(SerializedType.self, from: data),
                let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                completion(true, serverResponse as AnyObject)
            } else {
                completion(false, nil)
            }
            }.resume()
    }
}
