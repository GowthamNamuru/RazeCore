//
//  Networking.swift
//  RazeCore
//
//  Created by Gowtham on 22/11/20.
//

import Foundation
extension RazeCore {
    public class Networking {
        /// Responsible fo handling all networking calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
            public init() { }
            private let session = URLSession.shared
            public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completionHandler(result)
                }
                task.resume()
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
