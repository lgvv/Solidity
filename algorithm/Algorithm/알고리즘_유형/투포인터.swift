//
//  투포인터_알고리즘.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/13/24.
//

import Foundation

/// 특정한 합을 가지는 부분 연속수열을 찾아야 하는 경우
/// - warning: 음수가 있는 경우 사용할 수 없음.
///
/// 1. 시작점과 끝점이 첫번쨰 원소의 인덱스(0)을 가르키도록 한다.
/// 2. 현재 부분합이 m과 같다면 카운트 한다.
/// 3. 현재 부분합이 m보다 작으면 end를 1증가 시킨다.
/// 4. 현재 부분합이 m보다 크면 start를 1증가 시킨다.
/// 5. 모든 경우를 확인할 때까지 2-4 반복한다.
func 투포인터_1() {
    let m = 5 // 찾고자하는 부분합
    let data = [1, 2, 3, 2, 5] // 전체 수열
    
    var startIndex = 0
    var endIndex = 0
    
    var count = 0
    
    var isRepeat: Bool = true
    
    while isRepeat {
        // 종료조건
        if (startIndex == endIndex) && startIndex == (data.count - 1) { isRepeat = false }
        
        // 부분합: startIndex부터 endIndex까지 모두 더한다
        let result = data[startIndex...endIndex].reduce(0, +)
        print(result)
        
        if result == m {
            count += 1
            startIndex += 1
        } else if result < m {
            // 부분합이 찾고자하는 수보다 작은 경우
            endIndex += 1
        } else if result > m {
            // 부분합이 찾고자하는 수보다 큰 경우
            startIndex += 1
        }
    }
    
    let expectation = 3
    if expectation == count {
        print("성공")
    } else {
        print("실패")
    }
}

/// 특정한 합을 가지는 부분 연속수열을 찾아야 하는 경우
/// - important: 시간복잡도는 O(M+N)
/// 왜냐하면 각 배열을 한번씩만 참조하기 때문에
///
/// 1. 정렬된 리스트 A, B를 입력받는다.
/// 2. 리스트 A에서 처리되지 않은 원소 중 가장 작은 원소를 i가 가르키도록 한다.
/// 3. 리스트 B에서 처리되지 않은 원소 중 가장 작은 원소를 j가 가르키도록 한다.
/// 4. A[i]와 B[j] 중에서 더 작은 원소를 결과 리스트에 담는다.
/// 5. 리스트 A와 B에서 더이상 처리할 원소가 없을 떄가지 2-4를 반복한다.
func 투포인터_2() {
    let a = [1, 3, 5]
    let b = [2, 4, 6, 8]
    
    var aIndex = 0
    var bIndex = 0
    
    var isRepeat = true
    
    var result = [Int]()
    
    while isRepeat {
        let aValue = a[aIndex]
        let bValue = b[bIndex]
        
        if aValue < bValue {
            result.append(aValue)
            aIndex += 1
        } else {
            result.append(bValue)
            bIndex += 1
        }
        
        if aIndex == a.count {
            result += b[bIndex...]
            isRepeat = false
        } else if bIndex == b.count {
            result += a[aIndex...]
            isRepeat = false
        }
        
        print(result)
    }
    
    let expectation = [1, 2, 3, 4, 5, 6, 8]
    if expectation == result {
        print("성공")
    } else {
        print("fail")
    }
    
}
