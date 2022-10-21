//
//  HttpClient.swift
//  Instagram
//
//  Created by Kris on 10/18/22.
//

import Foundation

enum HttpMethod: String {
    case POST, GET, PUT, DELETE
}

enum MIMEType: String {
    case JSON = "application/json"
}

enum HttpHeaders: String {
    case contentType = "Content-Type"
}

enum HttpError: Error {
    case badURL, badResponse, errorDecodingData, invaildURL
}

class HttpClient
{
    private init () { }
    
    static let shared = HttpClient()
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw HttpError.errorDecodingData
        }
        
        return object
    }
    
    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws {
        var requset = URLRequest(url: url)
        
        requset.httpMethod = httpMethod
        requset.addValue(MIMEType.JSON.rawValue, forHTTPHeaderField: HttpHeaders.contentType.rawValue)
        
        requset.httpBody = try? JSONEncoder().encode(object)
        
        let (_, response) = try await URLSession.shared.data(for: requset)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
    }
    
    func delete(at id: UUID, url: URL) async throws {
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.DELETE.rawValue
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
    }
}
