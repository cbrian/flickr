//
//  Photo.swift
//  FlickrSearch
//
//  Created by Sanju Naik on 6/15/17.
//  Copyright © 2017 Sanju. All rights reserved.
//

let idkey =     "id"
let farmKey =   "farm"
let serverKey = "server"
let secretKey = "secret"

class Photo {
    
    var id: String?
    var farm: Int?
    var server: String?
    var secret: String?
    let size = "m"
    
    var url: String? {
        get {
            if let farm = farm, let server = server, let id = id, let secret = secret {
                return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg"
            }
            return nil
        }
    }
    
    init(with attributes: [String:Any]) {
        id = attributes[idkey] as? String
        farm = attributes[farmKey] as? Int
        server = attributes[serverKey] as? String
        secret = attributes[secretKey] as? String
    }
}
