//
//  ViewController.swift
//  Stream Daddy
//
//  Created by user on 4/6/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import Starscream

class ViewController: UIViewController, WebSocketDelegate {
    
    var socket: WebSocket!
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("Disconnected")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: URL(string: "http://localhost:4444")!)
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("got some text: \(text)")
    }

    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
        
        let testDict = [
            "_authenticate": "[]"
        ]
        
        do{
            let jsonBody = try JSONSerialization.data(withJSONObject: testDict, options: [.sortedKeys])
            socket.write(pong: jsonBody)
            
        }catch{
            print("failed to encode JSON")
        }
    }
}

