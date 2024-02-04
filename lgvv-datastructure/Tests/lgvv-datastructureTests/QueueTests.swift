//
//  QueueTests.swift
//
//
//  Created by Geon Woo lee on 2/4/24.
//

import XCTest
@testable import lgvv_datastructure

final class QueueTests: XCTestCase {
    var queue = Queue<Int>()
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func test_큐() {
        queue.enqueue(10)
        queue.enqueue(20)
        queue.enqueue(30)
        
        let _ = queue[2]
        
        queue.forEach { _ in }
    }
}
