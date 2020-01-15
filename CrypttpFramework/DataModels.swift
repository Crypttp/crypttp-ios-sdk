//
//  DataModels.swift
//  CrypttpFramework
//
//  Created by Maxim MAMEDOV on 17.12.2019.
//  Copyright © 2019 Maxim MAMEDOV. All rights reserved.
//

import Foundation

public struct CrypttpTransactions {
    let transactionId: String
    let transactions: [CrypttpTransactionInfo]
}

public struct CrypttpTransactionInfo {
    let coin: String
    let amount: String
    let to: String
    let payload: String
    let memo: String
    let onSuccessUrl: String
    let onFailureUrl: String
}
