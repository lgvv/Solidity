//
//  이진탐색.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/14/24.
//

import Foundation

func 이진탐색_1() {
    let array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19] // 주어진 배열
    let target = 4 // 찾아야 하는 수
    
    var startIndex = 0
    var endIndex = array.count - 1
        
    var midIndex = Int((startIndex + endIndex) / 2)
    
    var findIndex = -1
    
    while startIndex <= endIndex {
        if array[midIndex] == target {
            findIndex = midIndex
            break
        } else if array[midIndex] < target {
            // 찾고자하는 값보다 작은 경우 미들 값 다음 자리로
            startIndex = midIndex + 1
        } else if array[midIndex] > target {
            // 찾고자하는 값보다 큰 경우 미들 값 아래 자리로
            endIndex = midIndex - 1
        }
        print(midIndex)
        midIndex = Int((startIndex + endIndex) / 2)
    }
    
    if findIndex < 0 {
        print("찾고자하는 값이 없습니다.")
    } else {
        print("해당 값의 인덱스 \(midIndex)이고 값은 \(array[midIndex])")
    }
}
