//
//  HomeViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 3/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var albumTableView: UITableView!
    var welcomeString:String!
    var album = [Album]()
    @IBOutlet var mWelcomeLabel: UILabel!
    let menuItems = MenuItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mWelcomeLabel.text = "Welcome " + welcomeString
        self.albumTableView.estimatedRowHeight = 100;
        self.albumTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeRequest()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
        let row = indexPath.row
        cell.mMenuItemLabel.text = album[row].title + album[row].title + album[row].title
        cell.mMenuItemLabel.sizeToFit()
        cell.mAlbumImageView.imageFromServerURL(urlString: album[row].thumbnailUrl)
        return cell
    }
    
    /*func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }*/
}

extension HomeViewController {
    func makeRequest() -> Void {
        
        var config                              :URLSessionConfiguration!
        var urlSession                          :URLSession!
        
        config = URLSessionConfiguration.default
        urlSession = URLSession(configuration: config)
        
        let HTTPHeaderField_ContentType         = "Content-Type"
        let ContentType_ApplicationJson         = "application/json"
        let HTTPMethod_Get                      = "GET"
        
        let callURL = URL.init(string: "http://jsonplaceholder.typicode.com/photos")
        
        var request = URLRequest.init(url: callURL!)
        
        request.timeoutInterval = 60.0 // TimeoutInterval in Second
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
        request.httpMethod = HTTPMethod_Get
        
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            if error != nil{
                return
            }
            do {
                let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? [AnyObject] //Array<Dictionary<String, String>>
                print(resultJson)
               let albumJson = Album()
               self.album = albumJson.parseJson(json: resultJson!)//      Album.parseJson(resultJson)
                DispatchQueue.main.async{
                    self.albumTableView.reloadData()
                }
            } catch {
                print("Error -> \(error)")
            }
        }
        dataTask.resume()
    }
}
