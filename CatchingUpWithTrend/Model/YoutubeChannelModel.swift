// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let youtubeChannel = try? newJSONDecoder().decode(YoutubeChannel.self, from: jsonData)

import Foundation

// MARK: - YoutubeChannel
struct YoutubeChannel: Codable {
    let kind, etag: String
    let pageInfo: channelPageInfo
    let items: [channelItem]
}

// MARK: - Item
struct channelItem: Codable {
    let kind, etag, id: String
    let snippet: channelSnippet
}

// MARK: - Snippet
struct channelSnippet: Codable {
    let title, snippetDescription: String
    let publishedAt: String
    let thumbnails: channelThumbnails
    let localized: Localized

    enum CodingKeys: String, CodingKey {
        case title
        case snippetDescription = "description"
        case publishedAt, thumbnails, localized
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, localizedDescription: String

    enum CodingKeys: String, CodingKey {
        case title
        case localizedDescription = "description"
    }
}

// MARK: - Thumbnails
struct channelThumbnails: Codable {
    let thumbnailsDefault, medium, high: channelDefault

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct channelDefault: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct channelPageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
