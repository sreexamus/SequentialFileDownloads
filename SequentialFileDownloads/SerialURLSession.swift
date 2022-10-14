//
//  SerialURLSession.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import Foundation

class SerialURLSession {
    let urlSession: URLSession!
    static let shared = SerialURLSession()
    let operationQueue = OperationQueue()
    init() {
        urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: operationQueue)
        operationQueue.maxConcurrentOperationCount = 1
    }
    
    func addOperation(op: Operation) {
        operationQueue.addOperation(op)
    }
}
