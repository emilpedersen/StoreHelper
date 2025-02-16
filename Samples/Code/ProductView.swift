//
//  ProductView.swift
//  StoreHelperDemo
//
//  Created by Russell Archer on 25/01/2022.
//

import SwiftUI
import StoreHelper

@available(iOS 15.0, macOS 12.0, watchOS 9.0, *)
struct ProductView: View {
    @EnvironmentObject var storeHelper: StoreHelper
    @State private var isPurchased = false
    var productId: ProductId
    
    var body: some View {
        VStack {
            if isPurchased {
                Image(productId).bodyImage()
                Text("You have purchased this product and have full access 😀").font(.title).foregroundColor(.green)
            } else {
                Text("Sorry, you have not purchased this product and do not have access 😢").font(.title).foregroundColor(.red)
            }
        }
        .padding()
        .task {
            if let purchased = try? await storeHelper.isPurchased(productId: productId) {
                isPurchased = purchased
            }
        }
    }
}

