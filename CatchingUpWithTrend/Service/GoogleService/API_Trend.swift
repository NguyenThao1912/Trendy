//
//  API_Trend.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/28/21.
//

import Foundation
struct Api_Trend {
    static let base_google_trend = "https://trends.google.com/trends/trendingsearches/daily/rss?geo=VN"
    static func fetchData(url:String,completion: @escaping (_ data: [Item], _ error: Error?)->())  {
        guard let url = URL(string:  base_google_trend) else { return  }
        let session = URLSession(configuration: .default)
                let download = session.dataTask(with: url) { data, response, error in
                    guard let data = data else{
                        return
                    }
                    let xml = String(data: data, encoding: .utf8)!
                    let trendparser = TrendParser.parser(XMLString: xml)
                    
                    completion(trendparser, error)
                }
        download.resume()
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

}
