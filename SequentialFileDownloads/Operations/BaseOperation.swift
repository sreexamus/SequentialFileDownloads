//
//  BaseOperation.swift
//  SequentialFileDownloads
//
//  Created by sreekanth reddy iragam on 10/14/22.
//

import Foundation

public enum OperationState: String {
    case Ready
    case Executing
    case Finished
 
    /// Uses current state to return proper KVO keyPath
    var keyPath: String {
        return "is" + rawValue
    }
}
// swiftlint:enable identifier_name
 
/// Adds some required KVO boilerplate for manually
/// managing state of an operation
open class BaseOperation: Operation {
    /// Session manager that will create and manage the request
    // var sessionManager: SessionManager!
 
    /// Manages external KVO requirements for operation state
    open var state = OperationState.Ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
 
        didSet {
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }
 
    /// Operation is ready to run
    open override var isReady: Bool {
        return super.isReady && state == .Ready
    }
 
    /// Operation is currently executing
    open override var isExecuting: Bool {
        return state == .Executing
    }
 
    /// Operation has finished
    open override var isFinished: Bool {
        return state == .Finished
    }
 
    /// Operation runs asynchronously
    open override var isAsynchronous: Bool {
        return true
    }
 
    /// Sets state to cancelled to allow subclasses to respond appropriately
    open override func cancel() {
        state = .Finished
        super.cancel()
    }
}
