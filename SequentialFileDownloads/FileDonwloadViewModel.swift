//
//  FileDonwloadViewModel.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import Foundation

class FileDonwloadViewModel {
    let urls = [
        URL(string: "https://github.com/fluffyes/AppStoreCard/archive/master.zip")!,
        URL(string: "https://github.com/fluffyes/currentLocation/archive/master.zip")!,
        URL(string: "https://github.com/fluffyes/DispatchQueue/archive/master.zip")!,
        URL(string: "https://github.com/fluffyes/dynamicFont/archive/master.zip")!,
        URL(string: "https://github.com/fluffyes/telegrammy/archive/master.zip")!
    ]

    
    func downloadFilesUsingOperationQueue() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        for url in urls {
          let operation = BlockOperation(block: {
            print("start fetching \(url.absoluteString)")
            URLSession.shared.downloadTask(with: url, completionHandler: { (tempURL, response, error) in
              print("finished fetching \(url.absoluteString)")
            }).resume()
          })

          queue.addOperation(operation)
        }
    }
    
    
    func downloadFilesUsingDataTaskOperations() {
        var tasks: [URLSessionTask] = []
        for url in urls {
            let task = SerialURLSession.shared.urlSession.downloadTask(with: url, completionHandler: { (tempURL, response, error) in
              print("###finished fetching \(url.absoluteString)")
            })
              tasks.append(task)
        }
        SerialDataTaskHelper.addTasks(tasks: tasks)
    }
    
    /// Donwload files one after the other
    func downloadFilesSequentially() {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        for url in urls {
            operationQueue.addOperation(DownloadOperation(url: url))
        }
    }
}
