//
//  DeepLinkParser.swift
//  CrypttpFramework
//
//  Created by Maxim MAMEDOV on 17.12.2019.
//  Copyright © 2019 Maxim MAMEDOV. All rights reserved.
//

import Foundation

final class DeepLinkParser {
    static func parse(url: URL) -> CrypttpTransactions? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        let queryItem = components.queryItems?.first { $0.name == "params" }
        guard let query = queryItem?.value,
            let decodedQuery = Data(base64Encoded: query),
            let jsonDict = try? JSONSerialization.jsonObject(with: decodedQuery, options: .allowFragments) as? [String : Any],
            let transactionsArrays = jsonDict["params"] as? [[String]] else {
            return nil
        }
        let id = safeString(at: "id", from: jsonDict)
        var transactions = [CrypttpTransactionInfo]()
        for transactionArray in transactionsArrays {
            let coin = safeString(at: 0, from: transactionArray)
            let amountIndex = safeString(at: 1, from: transactionArray)
            let to = safeString(at: 2, from: transactionArray)
            let payload = safeString(at: 3, from: transactionArray)
            let memo = safeString(at: 4, from: transactionArray)
            let successUrl = safeString(at: 5, from: transactionArray)
            let failureUrl = safeString(at: 6, from: transactionArray)
            let transaction = CrypttpTransactionInfo(coin: coin,
                                                     amount: amountIndex,
                                                     to: to,
                                                     payload: payload,
                                                     memo: memo,
                                                     onSuccessUrl: successUrl,
                                                     onFailureUrl: failureUrl)
            transactions.append(transaction)
        }
        return CrypttpTransactions(transactionId: id, transactions: transactions)
    }
    
    static private func safeString(at key: String, from dict: [String : Any]) -> String {
        return (dict[key] as? String) ?? ""
    }
    
    static private func safeString(at index: Int, from array: [String]) -> String {
        guard array.count > index else {
            return ""
        }
        return array[index]
    }
}
