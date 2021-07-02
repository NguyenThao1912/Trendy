// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trend = try? newJSONDecoder().decode(Trend.self, from: jsonData)

import Foundation

// MARK: - Trend
struct Trend: Codable {
    let channel: Channel
}

// MARK: - Channel
struct Channel: Codable {
    let title, channelDescription: String
    let link: [String]
    let item: [Item]

    enum CodingKeys: String, CodingKey {
        case title
        case channelDescription = "description"
        case link, item
    }
}

// MARK: - Item
struct Item: Codable {
    let title, approxTraffic, itemDescription: String
    let link: String
    let pubDate: String
    let picture: String
    let pictureSource: String
    let newsItem: NewsItemUnion

    enum CodingKeys: String, CodingKey {
        case title
        case approxTraffic = "approx_traffic"
        case itemDescription = "description"
        case link, pubDate, picture
        case pictureSource = "picture_source"
        case newsItem = "news_item"
    }
}

enum NewsItemUnion: Codable {
    case newsItemElement(NewsItemElement)
    case newsItemElementArray([NewsItemElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([NewsItemElement].self) {
            self = .newsItemElementArray(x)
            return
        }
        if let x = try? container.decode(NewsItemElement.self) {
            self = .newsItemElement(x)
            return
        }
        throw DecodingError.typeMismatch(NewsItemUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for NewsItemUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .newsItemElement(let x):
            try container.encode(x)
        case .newsItemElementArray(let x):
            try container.encode(x)
        }
    }
}

// MARK: - NewsItemElement
struct NewsItemElement: Codable {
    let newsItemTitle, newsItemSnippet: String
    let newsItemURL: String
    let newsItemSource: String

    enum CodingKeys: String, CodingKey {
        case newsItemTitle = "news_item_title"
        case newsItemSnippet = "news_item_snippet"
        case newsItemURL = "news_item_url"
        case newsItemSource = "news_item_source"
    }
}
