//
//  MockUrlProtocol.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

class MockURLProtocol: URLProtocol {

    override class func canInit(with task: URLSessionTask) -> Bool {
        return true
    }

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let _ = request.url,
           let data = data(fileName: "PBTransactions", type: "json") {
            
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocol(self, didReceive: HTTPURLResponse(), cacheStoragePolicy: .allowed)
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}

extension MockURLProtocol {
    
    private func data(fileName: String, type: String) -> Data? {
        
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: type) {
                
                let data = try String(contentsOfFile: path).data(using: .utf8)
                return data
            }
        } catch {
            
            print("Unable to load data from json file....")
        }
        return nil
    }
}

