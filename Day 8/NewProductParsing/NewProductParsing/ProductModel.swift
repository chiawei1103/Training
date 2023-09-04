//
//  ProductModel.swift
//  NewProductParsing
//
//  Created by Lawrence on 9/1/23.
//

import Foundation

struct Product: Decodable {
    let productId: String
    let productName: String
    let shortDescription: String
    let price: Double
    let productImage: String
    let reviewRating: Double?
    let reviewCount: Int?
    let inStock: Bool?
}
