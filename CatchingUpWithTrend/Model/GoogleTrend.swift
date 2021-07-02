//
//  GoogleTrend.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/28/21.
//

import Foundation
import XMLMapper
class rss : XMLMappable{
    var nodeName: String!
    var channel :Channel?
    required init?(map: XMLMap) {
    }
    func mapping(map: XMLMap) {
        channel <- map["channel"]
    }
    
}
class Channel : XMLMappable{
    var nodeName : String!
    
    var item :[Item]?
    required init?(map: XMLMap) {}
    func mapping(map: XMLMap) {
        item <- map["item"]
    }
   
}
class Item: XMLMappable {
    var nodeName: String!
    
    var title           : String!
    var approx_traffic  : String!
    var description     : String!
    var link            : String!
    var pubDate         : String!
    var picture         : String!
    var picture_source  : String!
    var newsItem        : [newsItem]?
    required init?(map: XMLMap) {
        
    }
    func mapping(map: XMLMap) {
        title           <- map["title"]
        approx_traffic  <- map["ht:approx_traffic"]
        description     <- map["description"]
        link            <- map["link"]
        pubDate         <- map["pubDate"]
        picture         <- map["ht:picture"]
        picture_source  <- map["ht:picture_source"]
        newsItem        <- map["ht:news_item"]
    }
}
class newsItem: XMLMappable{
    var nodeName    : String!
    
    var itemTitle   : String!
    var itemSnippet : String!
    var itemURL     : String!
    var itemSource  : String!
    
    required init?(map: XMLMap) {}
    
    func mapping(map: XMLMap) {
        itemTitle   <- map["ht:news_item_title"]
        itemSnippet <- map["ht:news_item_snippet"]
        itemURL     <- map["ht:news_item_url"]
        itemSource  <- map["ht:news_item_source"]
    }
}
