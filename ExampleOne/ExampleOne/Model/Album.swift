//
//  Album.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 5/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//
/*
 
 {
 "albumId": 1,
 "id": 1,
 "title": "accusamus beatae ad facilis cum similique qui sunt",
 "url": "http://placehold.it/600/92c952",
 "thumbnailUrl": "http://placehold.it/150/30ac17"
 },
 
 */

import UIKit

class Album: NSObject {
    var title:String = ""
    var thumbnailUrl:String = ""
    
    override init() {
        
    }
    
    init(titles : String, thumbnailUrls: String) {
        title = titles
        thumbnailUrl = thumbnailUrls
    }
    
    public func parseJson(json: [AnyObject]) -> [Album] {
        var completeAlbum = [Album]()
        for jsonA  in json {
            completeAlbum.append(Album(titles: jsonA["title"]! as! String, thumbnailUrls: jsonA["thumbnailUrl"]! as! String))
        }
    return completeAlbum
    }
}
