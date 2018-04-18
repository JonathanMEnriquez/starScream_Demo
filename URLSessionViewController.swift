//
//  URLSessionViewController.swift
//  
//
//  Created by user on 4/6/18.
//

import UIKit

class URLSessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testDict = [
            "data": "GetAuthRequired"
        ]
        
        do {
            let jsonDict = try JSONSerialization.data(withJSONObject: testDict, options: [])
            
            let url = URL(string: "http://localhost:4444")
            let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
                if data != nil {
                    print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
                }
                if (error != nil) {
                    print(String(describing: error))
                }
                print("done")
            }
            task.resume()
        } catch {
            print("json failed")
        }
    }

    

}
