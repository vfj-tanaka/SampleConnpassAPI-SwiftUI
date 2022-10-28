//
//  Model.swift
//  SampleConnpassAPI-SwiftUI
//
//  Created by mtanaka on 2022/10/28.
//

import Foundation

struct Models: Codable {
    let models: [Model]
}

struct Model: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let eventUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title
        case eventUrl = "event_url"
    }
}
