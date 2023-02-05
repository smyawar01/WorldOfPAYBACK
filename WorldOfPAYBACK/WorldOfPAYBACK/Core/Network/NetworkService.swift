//
//  NetworkService.swift


import Foundation

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
            
        } catch {
            
            throw NetworkError.decodingError(error)
        }
    }
}
