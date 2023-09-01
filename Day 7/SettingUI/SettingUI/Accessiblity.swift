//
//  Setting.swift
//  SettingUI
//
//  Created by Lawrence on 8/31/23.
//

import Foundation

struct Accessiblity: Decodable {
    let accessiblity: [[String: [Item]]]
}
struct Item: Decodable {
    let label: String
    let icon: String
}
