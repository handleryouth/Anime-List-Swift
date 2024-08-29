//
//  RequestData.swift
//  Anime List
//
//  Created by Tony Gultom on 20/08/24.
//

import Foundation




//enum APIEndpoint {
//    case getUser(userId: String)
//    case getPost(userId: String, postId: String)
//    case getComments(postId: String)
//
//    var baseURL: String {
//        return "https://example.com/api"
//    }
//
//    var path: String {
//        switch self {
//        case .getUser(let userId):
//            return "/users/\(userId)"
//        case .getPost(let userId, let postId):
//            return "/users/\(userId)/posts/\(postId)"
//        case .getComments(let postId):
//            return "/posts/\(postId)/comments"
//        }
//    }
//
//    var url: URL? {
//        return URL(string: baseURL + path)
//    }
//}


enum RequestURLList {
    var path: String {
        switch(self) {
        case .getAnimeList:
            return "anime"
        case .getSeachAnime:
            return "anime"
        case .getSearchById(let id):
            return "anime/\(id)"
        case .getCharacterList:
            return "characters"
        case .getCharacterDetail(let id):
            return "characters/\(id)"
        }
    }
    
    case getAnimeList
    case getSeachAnime
    case getSearchById(id: String)
    case getCharacterDetail(id: String)
    case getCharacterList
    
    var baseURL: String {
        return "https://api.jikan.moe/v4/"
    }
    
    var url: URL! {
        return URL(string: baseURL + path)
    }
}


enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}


class RequestData {
    static func getData<T: Decodable>(requestUrl: RequestURLList,
                                      onSuccess: @escaping (T) -> Void,
                                      onFailed: @escaping (Error) -> Void,
                                      queryItems: [URLQueryItem] = [],
                                      onLoading: () -> Void,
                                      onFinally: (() -> Void)?) {
        
        onLoading()
        var url = requestUrl.url
        
        if(!queryItems.isEmpty) {
            url!.append(queryItems: queryItems)
        }
        
        var request = URLRequest(url: url!)
        
        print("url here!", url!)
        
        request.httpMethod = RequestMethod.get.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            
            if let error = error{
                print("Error while fetching data: ", error)
                onFailed(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            defer{
                onFinally?()
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                onSuccess(decodedData)
                
            } catch let jsonError{
                print("failed to decode JSON", jsonError)
                onFailed(jsonError)
            }
        }
        
        task.resume()
        
    }
}
