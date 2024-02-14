//
//  구간_합_계산.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/13/24.
//

import Foundation

/// 연속적으로 나열된 수의 합을 찾아야 하는 경우
/// N은 주어진 리스트의 개수, M의 쿼리의 수
/// - Important: 알고리즘에 따라 O(N+M) 잘못 작성할 경우 O(NM)
///
/// 1. N개의 수에 대하여 접두사 합(Prefix Sum)을 계산하여 배열 P에 저장한다.
/// 2. 매 M개의 쿼리 정보 [L, R]을 확인할 때, 구간 합은 P[R] - P[L-1]이다.
///
/// 해당 알고리즘으로 작성할 경우 매 쿼리당 O(1)이므로 (N+M)
func 구간_합_계산_1() {
    let a = [10, 20, 30, 40, 50] // 주어진 리스트
    var p: [Int] = [0] // 구간합 배열
    
    // 구간합 도출
    a.forEach { aValue in
        let sum = (p.last ?? 0) + aValue
        p.append(sum)
    }
    
    let left = 3
    let right = 4
    
    let result = p[right] - p[left-1] // 구간합 공식
    
    let expectation = 70
    if expectation == result {
        print("성공")
    } else {
        print("실패")
    }
}
