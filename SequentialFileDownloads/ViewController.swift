//
//  ViewController.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vm = FileDonwloadViewModel()
       // 1. calling network api inside block operation without using any custom operations. calls will be
       // starting one after the other but second operation will be called before the first is completed.
        //vm.downloadFilesUsingOperationQueue()
        
        // 2. download operations will start sequentially but as the network calls are asynchrnous and we are not setting the operation state to finished after the call is completed, the download finishing will be sporadic.
        //vm.downloadFilesUsingDataTaskOperations()
        
        // 3. to download file one after the other. second download file with start only after first download is complete
        vm.downloadFilesSequentially()
    }
}

