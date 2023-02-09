//
//  Reachible.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/6/23.
//

import Foundation
import Network
import SwiftUI

public enum ReachabilityStatus {
    
    case online
    case offline
}
public protocol ReachabilityService {
    
    var reachabilityStatus: ReachabilityStatus { get }
}

public final class ReachabilityServiceImpl: ReachabilityService {
    
    public var reachabilityStatus: ReachabilityStatus = .offline
    
    private let monitor = NWPathMonitor()
    
    init() {
        
        self.bind()
        self.startMonitoring()
    }
    deinit {
        
        self.stopMonitoring()
    }
}
private extension ReachabilityServiceImpl {
    
    private func startMonitoring() {
        
        let queue = DispatchQueue(label: "Monitor")
        self.monitor.start(queue: queue)
    }
    private func bind() {
        
        self.monitor.pathUpdateHandler = { [weak self] path in
            
            self?.reachabilityStatus = path.status == .satisfied ? .online : .offline
        }
    }
    private func stopMonitoring() {
        
        self.monitor.cancel()
    }
}
