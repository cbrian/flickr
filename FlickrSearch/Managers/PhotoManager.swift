//
//  PhotoManager.swift
//  FlickrSearch
//
//  Created by Sanju Naik on 6/15/17.
//  Copyright © 2017 Sanju. All rights reserved.
//

import Alamofire

let flickrApi    =  "https://api.flickr.com/services/rest"
let flickrMethod =  "flickr.photos.search"
let apiKeyValue  =  "739b660ea3629666d04b83ad0a19a381"
let limit        =  20

let methodKey =         "method"
let apiKey    =         "api_key"
let nojsoncallbackKey = "nojsoncallback"
let formatKey =         "format"
let safeSearchKey =     "safe_search"
let textKey =           "text"
let perPageKey =        "per_page"
let pageKey =           "page"


class PhotoManager {
    
    static func searchPhotos(forQuery searchText: String, page: Int, completion: @escaping (_ photos: [Photo])->Void) -> Void {
        
        guard let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        let parameters : [String: Any] = [
            methodKey:          flickrMethod,
            apiKey:             apiKeyValue,
            nojsoncallbackKey:  "1",
            formatKey:          "json",
            safeSearchKey:      "1",
            textKey:            encodedText,
            perPageKey:         limit,
            pageKey:            page
        ]
        
        Alamofire.request(flickrApi, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let results = response.result.value as? [String: Any],
                  let photosDict = results["photos"] as? [String: Any],
                  let photosArray = photosDict["photo"] as? [[String:Any]]
            else { return }
            
            completion(photosArray.map({ Photo(with: $0) }))
            
        }
    }
    


}
