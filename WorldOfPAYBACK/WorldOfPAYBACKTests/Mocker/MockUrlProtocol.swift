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
        guard let _ = request.url else {
            
            client?.urlProtocolDidFinishLoading(self)
            return
        }
        data(fileName: "PBTransactions", type: "json", completion: { [weak self] data in
            
            guard let self = self else { return }
            if let data = data {
                
                self.client?.urlProtocol(self, didLoad: data)
                self.client?.urlProtocol(self, didReceive: HTTPURLResponse(), cacheStoragePolicy: .allowed)
            }
            self.client?.urlProtocolDidFinishLoading(self)
        })
     }
    override func stopLoading() {}
}

extension MockURLProtocol {
    
    private func data(fileName: String, type: String, completion: @escaping (Data?) -> Void) {
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3) {
            
            do {
                if let path = Bundle.main.path(forResource: fileName, ofType: type) {
                    
                    let data = try String(contentsOfFile: path).data(using: .utf8)
                    return completion(data)
                }
            } catch(let error) {
                
                print("Unable to load data from json file....\(error)")
            }
            return completion(nil)
        }
    }
}

