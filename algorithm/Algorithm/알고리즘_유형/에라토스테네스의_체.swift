//
//  에라토스테네스의_체.swift
//  Algorithm
//
//  Created by Geon Woo lee on 2/13/24.
//

import Foundation

/// 여러개의 수가 소수인지 아닌지 판별하는데 사용
/// N보다 작거나 같은 모든 소수를 찾을때 사용 (약 1,000,000 이내)
/// - Important: O(nloglogN)으로 사실상 선형에 가까움
/// - 단점: 메모리가 많이 필요하며, 너무 큰 수의 경우에는 모든 수를 배열에 담아야 해서 불가능.
/// - Idea: 해당 수가 소수라면 그 배수는 소수일 수 없다.
///
/// 1. 2부터 N까지의 모든 자연수를 나열
/// 2. 남은 수 중에서 아직 처리하지 않은 가장 작은 수 i를 찾는다
/// 3. 남은 수 중에서 i의 배수를 모두 제거한다.(i는 제거하지 않는다.)
/// 4. 더 이상 반복할 수 없을 때까지 2번과 3번을 반복한다.
func 에라토스테네스의_체_1() {
    // 1부터 1000까지의 모든 수에 대한 소수 판별
    let n = 1000
    var array = Array(repeating: true, count: n+1)
    print(array.count)
    let maxRange = sqrt(Double(n)) + 1 // 제곱근 까지만 확인하면 돼
    
    for i in 2...Int(maxRange) {
        if array[i] == true {
            var j = 2
            
            while i * j <= n {
                array[i * j] = false
                j+=1
            }
        }
    }
    
    array.enumerated().forEach { index, value in
        if index == 0 || index == 1 { }
        else if value { print(index) }
    }
    
}
