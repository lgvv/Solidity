//
//  투포인터_알고리즘.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/15/24.
//

public struct Queue<T> {
    private var elements: [T] = []
    
    public init() {}
    
    /// 큐의 맨 뒤에 요소를 추가
    public mutating func enqueue(_ element: T) { 
        elements.append(element)
    }
    
    /// 큐에서 첫 요소를 제거한 뒤 반환
    public mutating func dnqueue(_ element: T) -> T? {
        elements.removeFirst()
    }
    
    /// 큐의 첫 요소를 반환하되 제거는 안함
    public mutating func peek(_ element: T) -> T? { 
        return elements.first
    }
    
    /// 큐를 재설정
    public mutating func clear() {
        elements = []
    }
    
    /// 큐가 비었는지 확인
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    /// 큐에 들어있는 갯수
    public var count: Int {
        elements.count
    }
    
    /// 큐가 꽉 찼는지 확인
    public var isFull: Bool {
        count == elements.capacity
    }
    
    /// 특정 인덱스 위치에 삽입
    public mutating func insert(_ element: T, at: Int) {
        elements.insert(element, at: at)
    }
    
    /// 특정 인덱스 위치에서 제거
    public mutating func remove(at: Int) {
        elements.remove(at: at)
    }
}

extension Queue {
    /// 시작 인덱스
    var startIndex: Int {
        0
    }
    
    /// 마지막 인덱스
    var endIndex: Int {
        return count - 1
    }
    
    public subscript(index: Int) -> T {
        elements[index]
    }
}

extension Queue: Sequence { 
    public func makeIterator() -> some IteratorProtocol {
        let index = IndexingIterator(_elements: self.elements.lazy.reversed())
        return AnyIterator(index)
    }
}
