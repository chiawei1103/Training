//
//  Products.swift
//  ProductsTableView
//
//  Created by Consultant on 8/30/23.
//

import Foundation

struct ProductsData: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
