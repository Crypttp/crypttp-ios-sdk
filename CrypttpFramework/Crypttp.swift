//
//  Crypttp.swift
//  CrypttpFramework
//
//  Created by Maxim MAMEDOV on 17.12.2019.
//  Copyright © 2019 Maxim MAMEDOV. All rights reserved.
//

import Foundation

public typealias EmptyClosure = () -> Void
public typealias Closure<T> = (T) -> Void

final public class Crypttp {
    public static let shared = Crypttp()
    
    public func parseCrypttpDeepLink(url: URL) -> CrypttpTransactions? {
        return DeepLinkParser.parse(url: url)
    }
    
    public func sendTransactionHash(transactionId: String,
                                    transactionHash: String,
                                    success: @escaping EmptyClosure,
                                    error: @escaping Closure<Error>) {
        Network.shared.sendTransactionHash(transactionId: transactionId,
                                           transactionHash: transactionHash,
                                           onSuccess: success,
                                           onError: error)
    }
}
