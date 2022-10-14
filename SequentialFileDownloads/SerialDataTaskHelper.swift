//
//  SerialDataTaskHelper.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import Foundation

enum SerialDataTaskHelper {
    static func addTask(task: URLSessionTask) {
        let downLoad = DownloadTask()
        downLoad.addTask(task: task)
        SerialURLSession.shared.addOperation(op: downLoad)
        task.resume()
    }
    
    static func addTasks(tasks: [URLSessionTask]) {
        tasks.forEach {addTask(task: $0)}
    }
}
