//
//  APIService.swift
//  SwiftUI-MVVM-ListView
//
//  Created by Arjun on 31/01/24.
//


import UIKit

struct APIBasePath {
    static let BASE_PATH_USER = "https://dummyjson.com/"
}

struct APIEndpoint {
    static let getUsers = APIBasePath.BASE_PATH_USER + "users"
//    static let getUserDetail = APIBasePath.BASE_PATH_USER + "users"
}

class APIService :  NSObject {
    
    static let shared           = APIService()
    private let cache           = NSCache<NSString, UIImage>()
    
    private override init() {}
        
    func apiToGetUserData(page: Int = 0, limit: Int = 10, completion : @escaping (Result<Users,APError>) -> ()){
        let urlEndpoint = APIEndpoint.getUsers + "?" + "limit" + "=\(limit)&" + "skip" + "=\(page)&" + "delay=1000"

        guard let url = URL(string: urlEndpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let _ = error{
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder()
                let tempData = try jsonDecoder.decode(Users.self, from: data)
                completion(.success(tempData))
                print(urlEndpoint)
                print(tempData)
            }
            catch (let error){
                print(error)
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
    func apiToGetUserDetail(id: Int, completion : @escaping (Result<User,APError>) -> ()){
        let urlEndpoint = APIEndpoint.getUsers + "/" + "=\(id)?" + "delay=1000"

        guard let url = URL(string: urlEndpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let _ = error{
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let jsonDecoder = JSONDecoder()
                let tempData = try jsonDecoder.decode(User.self, from: data)
                completion(.success(tempData))
                print(urlEndpoint)
                print(tempData)
            }
            catch {
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
