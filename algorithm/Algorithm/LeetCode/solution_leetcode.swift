// LeetCode

// MARK: - Array / String

class Solution_LC1768 {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let len1 = word1.count
        let len2 = word2.count
        
        var result: String = ""
        // 1. 두 단어의 교차된 부분을 먼저 처리
        zip(word1, word2).forEach { w1, w2 in
            result += "\(w1)\(w2)"
        }
        
        // 2. 두 단어의 남은 부분 처리
        if len1 > len2 {
            let remainingPart = word1.dropFirst(len2)
            result += remainingPart
        } else if len2 > len1 {
            let remainingPart = word2.dropFirst(len1)
            result += remainingPart
        }
        
        return result
    }
}

class Solution_LC1071 {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        // 최대 공약수 구하는 함수
        func gcd(_ a: Int, _ b: Int) -> Int {
//            print("a: \(a) b: \(b)")
            return b == 0 ? a : gcd(b, a % b)
        }
        
        // 두 문자열을 이어붙인 값이 서로 다르면 공통된 패턴이 없음
        if str1 + str2 != str2 + str1 {
            return ""
        }
        
        // 두 문자열 길이의 최대 공약수를 구하고, 그 길이만큼 자른 문자열이 답
        let gcdLength = gcd(str1.count, str2.count)
        return String(str1.prefix(gcdLength))
    }
}

class Solution_LC1431 {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max() ?? 100
        
        var results: [Bool] = []
        candies.forEach { candy in
            let result = candy + extraCandies >= max
            results.append(result)
        }
        
        return results
    }
}

class Solution_LC605 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var n = n
        
        if n == 0 { return true }
        
        for i in flowerbed.indices {
            if flowerbed[i] == 0 {
                let prevIndex = max(i-1, 0)
                let nextIndex = min(i+1, flowerbed.count-1)
                
                let prev = flowerbed[prevIndex] == 0
                let next = flowerbed[nextIndex] == 0
                
                if prev && next {
                    flowerbed[i] = 1
                    n -= 1
                }
            }
            
            if n == 0 { return true }
            
        }
        
        return false
    }
}

class Solution_LC345 {
    func reverseVowels(_ s: String) -> String {
        let vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        
        var finds = [Character]()
        
        s.forEach { c in
            if vowels.contains("\(c)") {
                finds.append(c)
            }
        }
        
        var answer = ""
        var lastIndex = finds.count - 1
        
        s.forEach { c in
            if vowels.contains("\(c)") {
                answer += "\(finds[lastIndex])"
                lastIndex -= 1
            } else {
                answer += "\(c)"
            }
        }
        
        return answer
    }
}

class Solution_LC151 {
    func reverseWords(_ s: String) -> String {
        let arr = s.split(separator: " ").reversed().joined(separator: " ")
//        print(arr)
        return arr
    }
}

class Solution_LC238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var nums = nums
        
        var zeroCount = 0
        var total = 1
        
//        var num = 0
        for i in nums.indices {
            var num = nums[i]
            if num == 0 {
                zeroCount += 1
                total *= 1
                
                if zeroCount >= 2 {
                    nums = nums.map { num in
                        return 0
                    }
                    return nums
                }
            } else {
                total *= num
            }
        }
        
        
        if zeroCount >= 2 {
            nums = nums.map { num in
                return 0
            }
            return nums
        } else if zeroCount == 1 {
            nums = nums.map { num in
                if num == 0 { return total }
                else { return 0 }
            }
        } else {
            nums = nums.map { num in
                if num == 0 { return total }
                else { return total / num }
            }
        }
        
        return nums
    }
}

class Solution_334 {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        // kLengthArray는 현재까지 발견한 k개의 증가하는 수열을 저장
        var k = 3
        var kLengthArray = Array(repeating: Int.max, count: k - 1)
        print(kLengthArray)
        for num in nums {
            for i in 0..<(k - 1) {
                if num <= kLengthArray[i] {
                    kLengthArray[i] = num // 적절한 위치에 값을 넣음
                    break
                }
                // 마지막 값보다 더 크면 k개의 수가 완성됨
                if i == k - 2 {
                    return true
                }
            }
        }
        return false // k개의 증가하는 수열이 없는 경우
    }
}

class Solution_443 {
    func compress(_ chars: inout [Character]) -> Int {
        
        if chars.count == 1 {
            return chars.count
        }
        
        var count = 1
        
        var result: String = ""
        for index in 1..<chars.count {
            let prev = chars[index-1]
            let char = chars[index]
            
            if prev == char {
                count += 1
            } else {
                if count != 1 {
                    result += "\(prev)\(count)"
                } else {
                    result += "\(prev)"
                }
                
                if index == chars.count - 1 {
                    if let last = chars.last {
                        result += "\(last)"
                    }
                }
                
                count = 1
            }
        }
        
        if count != 1 {
            if let last = chars.last {
                result += "\(last)\(count)"
            }
        }
        
//        print(count)
        var arr: [Character] = []
        result.forEach {
            arr.append($0)
        }
        chars = arr
//        print(result)
        return result.count
    }
}

// MARK: - Two Pointer

class Solution_283 {
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        
        var count = 0
        nums.forEach { num in
            if num == 0 {
                count += 1
            }
        }
        nums.removeAll { $0 == 0 }
        for _ in 0..<count {
            nums.append(0)
        }
        
//        print(nums)
    }
}

class Solution_392 {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s == "" { return true }
        var sIndex = s.startIndex
        
        var findCount = 0
        
        for tIndex in t.indices {
            let tValue = t[tIndex]
            
            if s[sIndex] == tValue {
                findCount += 1
                
                if findCount == s.count {
                    return true
                }
                
                let newIndex = s.index(after: sIndex)
                sIndex = newIndex
                
                
            }
        }
        
        return false
    }
}

class Solution_11 {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        
        
        
        while left < right {
            print("L \(left) , R \(right) | \(height[left]) | \(height[right])")
            let distance = right - left
            let area = distance * min(height[left], height[right])
            
            maxArea = max(maxArea, area)
            
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}

class Solution_1679 {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        if k == 1 { return 0 }
        
        var matchCount = 0
        // 숫자, 갯수
        var dict: [Int: Int] = [:]
        
        nums.forEach { num in
            if let count = dict[num] {
                dict[num] = count + 1
            } else {
                dict[num] = 1
            }
        }
        
        var keys: [Int] = dict.keys.map { $0 }
        
        while !keys.isEmpty {
            if let key = keys.first {
                
                if key >= k {
                    keys.removeAll { $0 == key }
    
                } else {

                    let matchKey = k - key
                    
                    let min = min(dict[matchKey] ?? 0, dict[key] ?? 0)
                    
                    if key == matchKey {
                        matchCount += (min / 2)
                    } else {
                        matchCount += min
                    }
                    
                    keys.removeAll { $0 == key || $0 == matchKey }
                }
                
                
            } else {
                break
            }
        }
        
        return matchCount
    }
}

// MARK: - Sliding Window

class Solution_643 {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // 먼저 첫 번째 k개의 요소 합계를 계산
        var currentSum = nums[0..<k].reduce(0, +)
        var maxSum = currentSum
        
        // 나머지 배열을 순회하면서 슬라이딩 윈도우로 합계를 조정
        for i in k..<nums.count {
            currentSum += nums[i] - nums[i - k]
            maxSum = max(maxSum, currentSum)
        }
        
        // 최대 합계를 k로 나누어 평균 반환
        return Double(maxSum) / Double(k)
    }
}

class Solution_1456 {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        let chars = Array(s)
        
        var maxVowels = 0
        var currentVowels = 0
        
        // 첫 번째 윈도우에 있는 모음 개수 계산
        for i in 0..<k {
            if vowels.contains(chars[i]) {
                currentVowels += 1
            }
        }
        
        if currentVowels == k {
            return k
        }
        
        maxVowels = currentVowels
        
        // 슬라이딩 윈도우를 오른쪽으로 이동
        for i in k..<chars.count {
            // 윈도우에서 빠지는 문자
            if vowels.contains(chars[i - k]) {
                currentVowels -= 1
            }
            // 윈도우에 새로 들어오는 문자
            if vowels.contains(chars[i]) {
                currentVowels += 1
            }
            // 최대 모음 개수 갱신
            maxVowels = max(maxVowels, currentVowels)
        }
        
        return maxVowels
    }
}

class Solution_1004 {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var maxLen = 0
        var zeroCount = 0

        for right in 0..<nums.count {
            // 오른쪽 포인터가 가리키는 값이 0이면 zeroCount 증가
            if nums[right] == 0 {
                zeroCount += 1
            }
            
            // zeroCount가 k보다 크면 왼쪽 포인터를 이동
            while zeroCount > k {
                print(right, left)
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            // 현재 윈도우 크기 (right - left + 1)과 maxLen을 비교하여 최대값 갱신
            maxLen = max(maxLen, right - left + 1)
        }

        return maxLen
    }
}

class Solution_1493 {
    func longestSubarray(_ nums: [Int]) -> Int {
        
        var left = 0
        var maxLen = 0
        var zeroCount = 0
        
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeroCount += 1
            }
            
            while zeroCount > 1 {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            maxLen = max(maxLen, right - left + 1)
        }
        
//        print(maxLen - 1)
        
        return maxLen - 1
    }
}

// MARK: - Prefix Sum

class Solution_1732 {
    func largestAltitude(_ gain: [Int]) -> Int {
        var height = 0
        var partialResult = 0
        
        gain.forEach { element in
            partialResult += element
          
            height = max(partialResult, height)
        }
        
//        print(height)
        return height
    }
}

class Solution_724 {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        var sum = 0
        nums.forEach { sum += $0 }
        
        var leftSum = 0
        var rightSum = sum - nums[0]
        
        if leftSum == rightSum {
            return 0
        }
        
        for i in 1..<nums.count {
            leftSum = leftSum + nums[i-1]
            rightSum = sum - leftSum - nums[i]
            
            if leftSum == rightSum {
                return i
            }
        }

        return -1
    }
}

// MARK: - Hash Map / Set

class Solution_2215 {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let a = Set(nums1).subtracting(Set(nums2))
        let b = Set(nums2).subtracting(Set(nums1))
        return [Array(a), Array(b)]
    }
}

class Solution_1207 {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var dict = [Int: Int]()
        
        for i in 0..<arr.count {
            dict[arr[i], default: 0] += 1
        }
        
        if Set(dict.keys).count == Set(dict.values).count {
            return true
        } else {
            return false
        }
    }
}

class Solution_1657 {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        // 1. 길이가 다르면 close할 수 없음
        if word1.count != word2.count {
            return false
        }
        
        // 2. 각 문자열에서 등장한 문자 집합을 구함
        let set1 = Set(word1)
        let set2 = Set(word2)
        
        // 3. 두 집합이 다르면 close할 수 없음
        if set1 != set2 {
            return false
        }
        
        // 4. 각 문자의 빈도를 계산
        let freq1 = word1.reduce(into: [Character: Int]()) { counts, char in
            counts[char, default: 0] += 1
        }
        
        let freq2 = word2.reduce(into: [Character: Int]()) { counts, char in
            counts[char, default: 0] += 1
        }
        
        // 5. 두 빈도 배열이 같은지 비교
        let sortedFreq1 = freq1.values.sorted()
        let sortedFreq2 = freq2.values.sorted()
        
        return sortedFreq1 == sortedFreq2
    }
}

class Solution_2352 {
    func equalPairs(_ grid: [[Int]]) -> Int {
        typealias Key = [Int]
        var colDict: [Key: Int] = [:]
        var rowDict: [Key: Int] = [:]
        
        for i in 0..<grid.count {
            var col = [Int]()
            var row = [Int]()
            
            col = grid[i]
            
            for j in 0..<grid.count {
                row.append(grid[j][i])
            }
            
            print(row, col)
            colDict.updateValue((colDict[col] ?? 0) + 1, forKey: col)
            rowDict.updateValue((rowDict[row] ?? 0) + 1, forKey: row)
        }
        
//        print(colDict)
//        print(rowDict)
        
        var count = 0
        colDict.forEach { key, value in
            let rowValue = rowDict[key] ?? 0
            count += rowValue * value
        }
        
//        print(count)
//        
        return count
    }
}
