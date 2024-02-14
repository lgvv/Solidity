//
//  이진탐색.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/14/24.
//

import Foundation

/// 이진탐색
/// - Important: 시간복잡도는 O(logN)
///
/// 1. 가운데 인덱스 값을 찾는다.
/// 2. 찾고자하는 값보다 작다면 미들값 + 1을 시작인덱스에 넣는다
/// 3. 찾고자하는 값보다 크다면 미들값 - 1을 끝인덱스에 넣는다
/// 4. 미들 인덱스를 갱신한다.
/// 5. 찾을떄까지 반복한다.
/// 6. 반복은 시작 인덱스가 끝 인덱스와 같거나 작을때.
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

/// 이진탐색
/// - Important: 시간복잡도는 O(logN)
/// - note: 파라메트리서치란 최적화 문제를 결정 문제로 바꿔서 해결하는 기법
/// 예를들어 범위 내에서 조건을 만족하는 가장 큰 값을 찾으라는 문제의 경우 사용
///
/// 문제
/// 1. 특정 어레이가 주어짐.
/// 2. 특정 값으로 모든 원소를 뺀 후 그 결과를 모두 더함.
/// 3. 모두 더한 결과가 적어도 M이상 얻기 위한 특정값의 최대값은 얼마인가?
func 이진탐색_파라메트리_서치_1() {
    let array = [19, 15, 10, 17]
    let m = 6
    
    var startValue = 0
    var endValue = array.max() ?? 0
    
    var middleValue = Int((startValue + endValue) / 2)
    
    var result: Int = 0
    while startValue <= endValue {
        var total = 0
        array.forEach { element in
            if element > middleValue {
                total += (element - middleValue)
            }
        }
        
//        print(startValue, endValue, middleValue, total)
        
        if total == m {
            // 정확히 일치하는 경우
            result = middleValue
            break
        } else if total < m {
            // 덜 자른 경우
            endValue = middleValue - 1
        } else if total > m {
            // 더 자른 경우
            
            // 특정 값의 최대값을 할당
            result = middleValue
            startValue = middleValue + 1
        }
        
        middleValue = Int((startValue + endValue) / 2)
    }
    
    print(result)
}
