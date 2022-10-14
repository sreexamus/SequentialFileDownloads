//
//  DownloadOperation.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import Foundation

class DownloadOperation: BaseOperation {
    var url: URL!
    init(url: URL) {
        self.url = url
    }
    override func start() {
        if isCancelled {
            state = .Finished
            return
        }
        
        state = .Executing
        print("###start fetching \(self.url.absoluteString)")
        let task = SerialURLSession.shared.urlSession.downloadTask(with: url, completionHandler: { [weak self] (tempURL, response, error) in
            print("###finished fetching \(self?.url.absoluteString)")
            self?.state = .Finished
        })
        
        task.resume()
        // make call
    }
}
