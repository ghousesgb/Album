//
//  Utitlies.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 5/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class Utitlies: NSObject {

}
let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        self.image = nil
        // check for cache
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
