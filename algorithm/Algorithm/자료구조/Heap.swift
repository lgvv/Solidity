//
//  Heap.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/24/24.
//

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        return self.elements.count == 1
    }
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements.last!
    }
    var count: Int {
        return self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return (index) / 2
    }
    mutating func add(element: T) {
        self.elements.append(element)
    }
    
    /// 위에서 아래로 내려가며 위치를 찾는 과정
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        print("i \(index) | V \(elements[index]) | L \(leftIndex) | R \(rightIndex)")
        
        // 왼쪽 자식의 인덱스가 마지막 인덱스를 초과하지 않으며, 값이 정렬 규칙을 만족하는 경우
        if leftIndex < self.elements.endIndex
            && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority])
        {
            // 우선순위를 왼쪽 인덱스로 수정
            higherPriority = leftIndex
        }
        
        // 왼쪽 자식의 인덱스가 마지막 인덱스를 초과하지 않으며, 값이 정렬 규칙을 만족하는 경우
        if rightIndex < self.elements.endIndex 
            && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) 
        {
            // 우선순위를 오른쪽 인덱스로 수정
            higherPriority = rightIndex
        }
        
        // 우선순위 인덱스가 처음 들어온 인덱스와 달라진 경우
        if higherPriority != index {
            // 우선순위와 해당 인덱스 스왑 (swapAt은 해당 인덱스의 값을 바꿈)
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    
    /// 아래에서 위로 올라가며 위치를 찾는 과정
    mutating func swimUp(from index: Int) {
        var index = index
        
        // index가 루트 위치가 아니고, 정렬조건을 만족하는 경우
        while index != 1
                && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)])
        {
            // 값 위치를 스왑
            self.elements.swapAt(index, self.parent(of: index))
            // 부모를 현재 인덱스에
            index = self.parent(of: index)
        }
    }
    
    /// 힙을 생성
    mutating func buildHeap() {
        let endOfRange = ((self.elements.count - 1) / 2)
        
        for index in (1...endOfRange).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func insert(node: T) {
        if self.elements.isEmpty {
            self.elements.append(node)
        }
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func remove() -> T? {
        if self.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}
