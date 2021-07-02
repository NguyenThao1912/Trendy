//
//  XMLParser.Delegate.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/26/21.
//

import Foundation
//extension TrendParser {
//    func parseTrand(url:String , completionHandler : (([RSSItem]) -> Void)?)
//    {
//        self.trendParseComplitionHandler = completionHandler
//        let request = URLRequest(url: URL(string: url)!)
//        
//        let urlSession = URLSession.shared
//        let task = urlSession.dataTask(with: request) { (data, response, error) in
//            guard let data = data else{
//                if let error = error{
//                    print(error.localizedDescription)
//                }
//                return
//            }
//             let parser = XMLParser(data: data)
//            parser.delegate = self
//            parser.parse()
//            
//        }
//        task.resume()
//    }
//    //MARK: - XML Parser DELEGATE
//
//    public func parserDidStartDocument(_ parser: XMLParser) {
//        
//    }
//    public func parserDidEndDocument(_ parser: XMLParser) {
//        
//    }
//    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        
//        if elementName == "item"{
//            isReadingItem       = true
//        }
//        else if elementName == "ht_news_item"{
//            isReadingNewsItem   = true
//        }
//    }
//}
