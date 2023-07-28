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
    
    var connectionStatus: CurrentValueSubject<ReachabilityStatus, Never> { get }
}

public final class ReachabilityServiceImpl: ReachabilityService {
    
    private(set) public var connectionStatus = CurrentValueSubject<ReachabilityStatus, Never>(.online)
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
            self.connectionStatus.send(path.status == .satisfied ? .online : .offline)
        }
    }
    private func stopMonitoring() {
        
        self.monitor.cancel()
    }
}
