//
//  XMLParser.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/25/21.
//

import Foundation
import XMLMapper
class TrendParser  {
    static func parser(XMLString : String) -> [Item]
    {
        guard let GoogleTrend = XMLMapper<rss>().map(XMLString: XMLString) else {
            return []
        }
        
        guard let data = GoogleTrend.channel?.item else {
            return []
        }
    
        return data
        
    }
}
