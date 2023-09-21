import UIKit
import Foundation

// 643. Maximum Average Subarray I

func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var sum = 0
    if nums.count == 1 {
        return Double(nums[0])
    }
    for index in 0...k - 1 {
        sum += nums[index]
    }
    var resultSum = sum
    if nums.count > k {
        for index in k...nums.count - 1 {
            sum += (nums[index] - nums[index - k])
            resultSum = max(resultSum, sum)
        }
    }
    return Double(Double(resultSum) / Double(k))
}

//print(findMaxAverage([1,12,-5,-6,50,3], 4))

func increasingTriplet(_ nums: [Int]) -> Bool {
    var mid = 22222222
    var left = 22222222
    if nums.count < 3 {
        return false
    }
    for index in 0...nums.count - 1 {
        if nums[index] > mid {
            return true
        } else if nums[index] > left && nums[index] < mid {
            mid = nums[index]
        } else if nums[index] < left {
            left = nums[index]
        }
    }
    return false
}

//print(increasingTriplet([2,1,5,0,4,6]))

// 443. String Compression

func compress(_ chars: inout [Character]) -> Int {
    var ansArray: [String] = []
    var count = 1
    if chars.count == 1 {
        return 1
     }
    ansArray.append("\(chars[0])")
    for index in 1...chars.count - 1 {
        if chars[index] == chars[index - 1] {
            if count == 1 {
                ansArray.append("\(count + 1)")
                count += 1
            } else {
                ansArray[ansArray.count - 1] = "\(count + 1)"
                count += 1
            }
        } else {
            count = 1
            ansArray.append("\(chars[index])")
        }
    }
    var string = ansArray.joined(separator: "")
    chars = Array(string)
    return string.count
}

//var c : [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
//print(compress(&c))

func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count - 1
    var i = -1
    var j = 0
    while(j < count){
        if(nums[j] != 0){
            i += 1
            print(nums)
            nums.swapAt(i, j)
            print(nums)
        }
        j += 1
    }
}

//var nums = [0,1,0,3,12]
//print(moveZeroes(&nums))

// 392. Is Subsequence

func isSubsequence(_ s: String, _ t: String) -> Bool {
    var result = false
    if s == "" {
        return true
    }
    var indexOfT = s.startIndex
    t.forEach { character in
        if "\(character)" == "\(s[indexOfT])" {
            if indexOfT == s.endIndex {
                result = true
            } else {
                indexOfT = s.index(after: indexOfT)
            }
        }
    }
    return result
}

//print(isSubsequence("asdbxsffcdeegf", "abc"))
