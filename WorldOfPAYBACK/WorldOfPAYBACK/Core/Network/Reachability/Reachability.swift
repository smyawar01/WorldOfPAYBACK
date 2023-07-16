//
//  Reachible.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/6/23.
//

import Foundation
import Network
import Combine

public enum ReachabilityStatus {
    
    case online
    case offline
}
public protocol ReachabilityService {
    
    // Define connectionStatus (wrapped value)
        var connectionStatus: ReachabilityStatus { get }
        
        // Define connectionStatus publisher
        var connectionStatusPublisher: Published<ReachabilityStatus>.Publisher { get }
}

public final class ReachabilityServiceImpl: ReachabilityService {
    
    @Published public private(set) var connectionStatus: ReachabilityStatus = .online
    public var connectionStatusPublisher: Published<ReachabilityStatus>.Publisher { $connectionStatus }
    private let monitor = NWPathMonitor()
    
    init() {
        
        bind()
        startMonitoring()
    }
    deinit {
        
        self.stopMonitoring()
    }
}
private extension ReachabilityServiceImpl {
    
    private func startMonitoring() {
        
        let queue = DispatchQueue(label: "NWPathMonitorQueue")
        self.monitor.start(queue: queue)
    }
    private func bind() {
        
        self.monitor.pathUpdateHandler = { [weak self] path in
            
            print("bind: \(path)")
            guard let self else { return }
            self.connectionStatus =  path.status == .satisfied ? .online : .offline
        }
    }
    private func stopMonitoring() {
        
        self.monitor.cancel()
    }
}
