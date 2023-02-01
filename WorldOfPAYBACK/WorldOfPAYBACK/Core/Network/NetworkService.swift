//
//  NetworkService.swift


import Foundation

enum NetworkError: Error {
    
    case transportError(Error)
    case serverError(Int)
    case noData
    case decodingError(Error)
}

protocol NetworkService {
    
    func execute<Model: Decodable>(url: URL) async throws -> Model
}

struct NetworkSerivceImpl: NetworkService {
    
    let session: URLSession
    let decoder: JSONDecoder
    
    func execute<Model: Decodable>(url: URL) async throws -> Model {
        
        let (data, response) = try await session.data(from: url)
        
        if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
            
            throw NetworkError.serverError(response.statusCode)
        }
        do {
            
            let model = try decoder.decode(Model.self, from: data)
            return model
            
        } catch (let error) {
            
            throw NetworkError.decodingError(error)
        }
    }
}
