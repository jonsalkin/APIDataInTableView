//
//  HeroStats.swift
//  APIDataInTableView
//
//  Created by Jon Salkin on 5/15/23.
//

import Foundation

struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
