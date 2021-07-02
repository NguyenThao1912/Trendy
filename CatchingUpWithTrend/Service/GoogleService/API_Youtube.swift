//
//  API_Youtube.swift
//  CatchingUpWithTrend
//
//  Created by Nguyen Huu Thao on 6/29/21.
//

import Foundation
struct API_Youtube{
    let baseUrl = "https://youtube.googleapis.com/youtube/v3/search"
    static let GOOGLE_API_KEY = "AIzaSyB6dtaLqRmqQJ9xNw4Yu-wR2IYcSIMP_08"
    static func fetchData(queryString:String , completion: @escaping (Result<YoutubeResponse,Error>)->())  {
        guard  let url = constructURL(queryString: queryString) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error{
                print("ERROR ON API SEARCH YOUTUBE")
                print("ERROR : \(error)")
                return
            }
            guard let data = data else{
                return
            }
            do{
                let youtubeSearch  = try JSONDecoder().decode(YoutubeResponse.self, from: data)
                completion(.success(youtubeSearch))
            }
            catch{
                completion(.failure(error))
            }
        }.resume() // DO NOT FORGET THIS !!!
        

    }
    static func constructURL (queryString:String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "youtube.googleapis.com"
        components.path = "/youtube/v3/search"
        components.queryItems = [
            URLQueryItem(name: "q"      , value:queryString ),
            URLQueryItem(name: "key"    , value: GOOGLE_API_KEY),
            URLQueryItem(name: "order"  , value:"rating" ),
            URLQueryItem(name: "maxResults", value: "15"),
            URLQueryItem(name: "part"   ,value: "snippet")
        ]
        return components.url
    }
    
    static func constructChannelURL(channelID : String) -> URL?{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "youtube.googleapis.com"
        components.path = "/youtube/v3/channels"
        components.queryItems = [
            URLQueryItem(name: "id"      , value:channelID ),
            URLQueryItem(name: "key"    , value: GOOGLE_API_KEY),
            URLQueryItem(name: "part", value: "snippet")
        ]
        return components.url
    }
    
    static func fetchChannelProfile(ChannelID : String , completion : @escaping (Result<YoutubeChannel,Error>)->() ){
        guard let url = constructChannelURL(channelID: ChannelID) else { return  }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error{
                print("ERROR ON API GET CHANNEL YOUTUBE")
                print("ERROR : \(error)")
                return
            }
            guard let data = data else{
                return
            }
            do{
                let youtubeChannelProfile  = try JSONDecoder().decode(YoutubeChannel.self, from: data)
                completion(.success(youtubeChannelProfile))
            }
            catch{
                completion(.failure(error))
            }
            
        }.resume() // DO NOT FORGET THIS !!!
        
    }
    
    static func downloadImgFromURL(url : String,completion:@escaping (Data?, URLResponse?, Error?) -> ()){
        guard let url = URL(string: url) else { return  }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("ERROR ON DOWNLOAD IMAGE YOUTUBE")
                print("ERROR : \(error)")
                return
            }
          
            completion(data,response,error)
            
         
        }.resume()
    }
}
