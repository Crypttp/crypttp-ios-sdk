//
//  Network.swift
//  CrypttpFramework
//
//  Created by Maxim MAMEDOV on 17.12.2019.
//  Copyright © 2019 Maxim MAMEDOV. All rights reserved.
//

import Foundation

public struct UnknownError: Error {
    public var localizedDescription: String {
        return "Unknown Error"
    }
}


final class Network {
    
    private let session = URLSession(configuration: .default)
    
    static let shared = Network()
    
    private struct Constants {
        static let urlString = "https://api.crypttp.com/aqr/"
        static let saveHashPath = "saveConfirmedHash"
    }

    func sendTransactionHash(transactionId: String,
                             transactionHash: String,
                             onSuccess: @escaping EmptyClosure,
                             onError: @escaping Closure<Error>) {
        let params = ["id" : transactionId, "hash" : transactionHash]
        guard let url = URL(string: "\(Constants.urlString)\(Constants.saveHashPath)"),
            let json = try? JSONSerialization.data(withJSONObject: params,
                                                   options: .prettyPrinted) else {
            onError(UnknownError())
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = json
        
        let dataTask = session.dataTask(with: request) { (_, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    onError(error)
                }
            } else if
              let response = response as? HTTPURLResponse, response.statusCode == 200 {
                DispatchQueue.main.async {
                    onSuccess()
                }
            } else {
                DispatchQueue.main.async {
                    onError(UnknownError())
                }
            }
        }
        
        dataTask.resume()
        
    }
}
