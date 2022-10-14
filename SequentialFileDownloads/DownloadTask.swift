//
//  DownloadTask.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import Foundation

class DownloadTask: Operation {
    var task: URLSessionTask!
    func addTask(task: URLSessionTask) {
        self.task = task
    }
}
