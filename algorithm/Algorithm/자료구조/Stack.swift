//
//  Stack.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/18/24.
//

public struct Stack<T> {
    /// 요소
    private var elements: [T] = []
    
    public init() {}
    
    /// 스택에 삽입
    public mutating func push(element: T) {
        elements.append(element)
    }
    
    /// 스택에서 요소를 꺼냄
    public mutating func pop(element: T) -> T? {
        elements.popLast()
    }
    
    /// 스택에서 요소를 확인
    public mutating func peek() -> T? {
        elements.last
    }
    
    /// 스택이 비어있는지 확인
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    /// 스택에 들어있는 개수
    public var count: Int {
        elements.count
    }
}

extension Stack: Sequence {
    public func makeIterator() -> some IteratorProtocol {
        let index = IndexingIterator(_elements: self.elements.lazy.reversed())
        return AnyIterator(index)
    }
}
