//
//  PurchaseInfo.swift
//  StoreHelper
//
//  Created by Russell Archer on 29/07/2021.
//

import StoreKit

/// Summarized information about a non-consumable purchase.
@available(iOS 15.0, macOS 12.0, watchOS 9.0, *)
public struct PurchaseInfo {
    
    public init(product: Product) {
        self.product = product
    }
    
    /// The product.
    public var product: Product

    /// The most recent StoreKit-verified transaction for a non-consumable. nil if verification failed.
    public var latestVerifiedTransaction: Transaction?
}

