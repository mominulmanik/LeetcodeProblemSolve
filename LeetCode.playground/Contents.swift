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

//1679. Max Number of K-Sum Pairs

func maxOperations(_ nums: [Int], _ k: Int) -> Int {
    var inputNums = nums
    inputNums.sort()
    print(inputNums)
    var i = 0
    var j = inputNums.count - 1
    var count = 0
    while j > i {
        if inputNums[i] + inputNums[j] == k {
            count += 1
            i += 1
            j -= 1
        } else if inputNums[i] + inputNums[j] < k {
            i += 1
        } else {
            j -= 1
        }
    }
    return count
}

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

// 11. Container With Most Water

func maxArea(_ height: [Int]) -> Int {
    var i = 0
    var j = height.count - 1
    var maxArea = 0
    var width = 0
    while i < j {
        width = abs(i - j)
        let area = width * min(height[i] , height[j])
        maxArea = max(area, maxArea)
        if height[i] > height[j] {
            j -= 1
        } else {
            i += 1
        }
    }
    return maxArea
}

//392. Is Subsequence

func isSubsequence(_ s: String, _ t: String) -> Bool {
    var result = false
    if s == "" {
        return true
    }
    var indexOfT = s.startIndex
    var count = 0
    t.forEach { character in
        if "\(character)" == "\(s[indexOfT])" {
            count += 1
            if count == s.count {
                result = true
            } else {
                indexOfT = s.index(after: indexOfT)
            }
        }
    }
    return result
}

//283. Move Zeroes

func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    var i = -1
    var j = 0
    while(j < count){
        if(nums[j] != 0){
            i += 1
            nums.swapAt(i, j)
        }
        j += 1
    }
}

// 334. Increasing Triplet Subsequence

func increasingTriplet(_ nums: [Int]) -> Bool {
        var mid = 2147483647
        var left = 2147483647
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

// 238. Product of Array Except Self

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let length = nums.count
    var productArray: [Int] = []
    var lProduct: [Int] = nums
    var rProduct: [Int] = nums
    
    var j = 0
    lProduct[0] = 1
    rProduct[length - 1] = 1
    
    for index in 1...(length - 1) {
        j = (length - 1) - index
        lProduct[index] = lProduct[index - 1] * nums[index - 1]
        rProduct[j] = rProduct[j + 1] * nums[j + 1]
    }
    for index in 0...(length - 1) {
        productArray.append(lProduct[index] * rProduct[index])
    }

    return productArray
}

// 151. Reverse Words in a String

func reverseWords(_ s: String) -> String {
    var reversedWords = ""
    let array = s.split(separator: " ").reversed()
    array.forEach { word in
        reversedWords += reversedWords == "" ? "\(word)" : " \(word)"
    }
    return reversedWords
}

// 345. Reverse Vowels of a String

func reverseVowels(_ s: String) -> String {
    var reversedWord = ""
    let vowelArray = ["a", "e", "i", "o", "u"]
    var vowelString = ""
    s.forEach { character in
        if vowelArray.contains("\(character)".lowercased()) {
            vowelString += "\(character)"
        }
    }
    print("View String : \(vowelString)")
    s.forEach { character in
        reversedWord += vowelArray.contains("\(character.lowercased())") ? "\(vowelString.removeLast())" : "\(character)"
    }
    return reversedWord
}

// 605. Can Place Flowers

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var flowerBedArray = flowerbed
    var noOfPlantedFlower = 0
    for i in 0...(flowerBedArray.count - 1) {
        if i == 0 {
            if flowerBedArray.count == 1 && flowerBedArray[i] != 1 {
                flowerBedArray[i] = 1
                noOfPlantedFlower += 1
            } else {
                if flowerBedArray[i] != 1 && flowerBedArray[i + 1] == 0 {
                    flowerBedArray[i] = 1
                    noOfPlantedFlower += 1
                }
            }
        } else if i == flowerBedArray.count - 1 {
            if flowerBedArray[i] != 1 && flowerBedArray[i - 1] == 0 {
                flowerBedArray[i] = 1
                noOfPlantedFlower += 1
            }
        } else {
            if flowerBedArray[i] != 1 && flowerBedArray[i - 1] == 0 && flowerBedArray[i + 1] == 0 {
                flowerBedArray[i] = 1
                noOfPlantedFlower += 1
            }
        }
    }
    return n <= noOfPlantedFlower
}

// 1431. Kids With the Greatest Number of Candies

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    let max = candies.max() ?? candies[0]
    var resultArray: [Bool] = []
    candies.forEach { candy in
        resultArray.append(candy + extraCandies >= max)
    }
    return resultArray
}

// 1071. Greatest Common Divisor of Strings

func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    guard str1 + str2 == str2 + str1 else { return "" }
    let gcdLen = gcd(max(str1.count, str2.count), min(str1.count, str2.count))
    return String(str1.prefix(gcdLen))
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let tmp = b
        b = a % b
        a = tmp
    }
    return a
}

// 1768. Merge Strings Alternately

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    var word1String = word1
    var word2String = word2
    var outputString = ""
    if word1String.count < word2String.count {
        while word1String.count > 0 {
            outputString = outputString + "\(word1String.removeFirst())\(word2String.removeFirst())"
        }
        outputString = outputString + word2String
    } else {
        while word2String.count > 0 {
            outputString = outputString + "\(word1String.removeFirst())\(word2String.removeFirst())"
        }
        outputString = outputString + word1String
    }
    
    return outputString
}

// 1046. Last Stone Weight

func lastStoneWeight(_ stones: [Int]) -> Int {
    var s = stones
    s.sort()
    s = s.reversed()
    var index = 0
    while s.count > 1 {
        if s[index] == s[index + 1] {
            s.remove(at: 0)
            s.remove(at: 0)
        } else {
            s[index + 1] = abs(s[index] - s[index + 1])
            s.remove(at: 0)
        }
        s.sort()
        s = s.reversed()
        index = 0
    }
    if s.count == 0 {
        return 0
    } else {
        return s[0]
    }
}

// 153. Find Minimum in Rotated Sorted Array

func findMin(_ nums: [Int]) -> Int {
    return findMinimum(nums, 0, nums.count - 1)
}

func findMinimum (_ nums: [Int], _ lowerIndex: Int, _ upperIndex: Int) -> Int {
    if upperIndex < lowerIndex {
        return nums[0]
    }
    if upperIndex == lowerIndex {
        return nums[lowerIndex]
    }
    let currentIndex = (lowerIndex + upperIndex) / 2
    if (currentIndex < upperIndex) && (nums[currentIndex + 1] < nums[currentIndex]) {
        return nums[currentIndex + 1]
    }
    if (currentIndex > lowerIndex) && (nums[currentIndex] < nums[currentIndex - 1]) {
        return nums[currentIndex]
    }
    if (nums[upperIndex] > nums[currentIndex]) {
        return findMinimum(nums, lowerIndex, currentIndex - 1)
    } else {
        return findMinimum(nums, currentIndex + 1, upperIndex)
    }
}

// 74. Search a 2D Matrix

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var oneDarray: [Int] = []
    matrix.forEach { array in
        oneDarray += array
    }
    return binarySearch(oneDarray, target)
}

func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
    var lowerIndex: Int = 0
    var upperIndex: Int = nums.count - 1
    while (lowerIndex <= upperIndex) {
        let currentIndex = (lowerIndex + upperIndex) / 2
        if (nums[currentIndex] == target) {
            return true
        } else {
            if (nums[currentIndex] > target) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
    return false
}

// 33. Search in Rotated Sorted Array

func search(_ nums: [Int], _ target: Int) -> Int {
    var lowerIndex = 0
    var upperIndex = nums.count - 1
    while lowerIndex <= upperIndex {
        let currentIndex = (lowerIndex + upperIndex) / 2
        if nums[currentIndex] == target {
            return currentIndex
        }
        if nums[lowerIndex] <= nums[currentIndex] {
            if nums[currentIndex] > target  && nums[lowerIndex] <= target{
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        } else {
            if nums[currentIndex] < target  && nums[upperIndex] >= target {
                lowerIndex = currentIndex + 1
            } else {
                upperIndex = currentIndex - 1
            }
        }
    }
    return -1
}

// 34. Find First and Last Position of Element in Sorted Array

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let count = nums.count
    var lowerIndex = 0
    var upperIndex = count - 1
    var positionArray: [Int] = [-1,-1]
    while (lowerIndex <= upperIndex) {
        let currentIndex = (lowerIndex + upperIndex)/2
        if(nums[currentIndex] == target) {
            positionArray[0] = currentIndex
            upperIndex = currentIndex - 1
        } else if (lowerIndex > upperIndex) {
            return [-1, -1]
        } else {
            if (nums[currentIndex] > target) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
    lowerIndex = 0
    upperIndex = count - 1
    while (lowerIndex <= upperIndex) {
        let currentIndex = (lowerIndex + upperIndex)/2
        if(nums[currentIndex] == target) {
            positionArray[1] = currentIndex
            lowerIndex = currentIndex + 1
        } else if (lowerIndex > upperIndex) {
            return [-1, -1]
        } else {
            if (nums[currentIndex] > target) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
    return positionArray
}

// 116. Populating Next Right Pointers in Each Node

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func connect(_ root: Node?) -> Node? {
    if root == nil  {
        return root
    }
    helper(node1: root?.left, node2: root?.right)
    return root
}

func helper(node1: Node?, node2: Node?) -> Node?{
    if node1 == nil {
        return node1
    } else {
        node1?.next = node2
        helper(node1: node1?.left, node2: node1?.right)
        helper(node1: node2?.left, node2: node2?.right)
        helper(node1: node1?.right, node2: node2?.left)
        return node1
    }
}

// 206. Reverse Linked List

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard let head = head, let _ = head.next else { return head }

    let newHead = reverseList(head.next)

    let nextNode = head.next
    nextNode?.next = head

    head.next = nil

    return newHead
}

// 617. Merge Two Binary Trees

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    if root1 == nil {
        return root2
    }
    if root2 == nil {
        return root1
    }
    root1?.val += root2!.val
    root1?.left = mergeTrees(root1?.left, root2?.left)
    root1?.right = mergeTrees(root1?.right, root2?.right)
    return root1
}

// 695. Max Area of Island

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var maxArea: Int = 0
    let width = grid.count
    let height = grid[0].count
    var visited = Set<Position>()
    for r in 0..<width {
        for c in 0..<height {
            if !visited.contains(Position(sr: r, sc: c)) {
                let result = calculateAreaofIsland(grid: grid, r: r, c: c, visited: visited)
                maxArea = max(maxArea, result.0)
                visited = result.1
            }
        }
    }
    return maxArea
}

func calculateAreaofIsland(grid: [[Int]], r: Int, c: Int, visited: Set<Position>) -> (Int, Set<Position>) {
    let width = grid.count
    let height = grid[0].count
    var callStack = [Position(sr: r, sc: c)]
    var visited = visited
    var area = 0
    while !callStack.isEmpty {
        let current = callStack.removeLast()
        if grid[current.sr][current.sc] == 1 && !visited.contains(current) {
            area += 1
            visited.insert(current)
            // north
            let northPosition = Position(sr: current.sr, sc: current.sc - 1)
            if current.sc >= 1 {
                  callStack.append(northPosition)
            }
            // south
            let southPosition = Position(sr: current.sr, sc: current.sc + 1)
            if current.sc + 1 < height {
                    callStack.append(southPosition)
            }
            
            // east
            let eastPosition = Position(sr: current.sr + 1, sc: current.sc)
            if current.sr + 1  < width {
                   callStack.append(eastPosition)
            }
            // west
            let westPosition = Position(sr: current.sr - 1, sc: current.sc)
            if current.sr >= 1 {
                   callStack.append(westPosition)
            }
        }
    }
    return (area, visited)
}

struct Position: Equatable, Hashable {
    let sr: Int
    let sc: Int
    
    public static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.sr == rhs.sr && lhs.sc == rhs.sc
    }
}

// 733. Flood Fill

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    let existingColor = image[sr][sc]
    if color != existingColor {
        let resultImage = applyDFS(image: image, r: sr, c: sc, color: existingColor, newColor: color)
        return resultImage
    }
    return image

}

func applyDFS(image: [[Int]], r: Int, c: Int, color: Int, newColor: Int) -> [[Int]] {
    var updatedImage = image
    if updatedImage[r][c] == color {
        updatedImage[r][c] = newColor
        if (r >= 1) {
            updatedImage = applyDFS(image: updatedImage, r: r - 1, c: c, color: color, newColor: newColor)
        }
        if (c >= 1) {
            updatedImage = applyDFS(image: updatedImage, r: r, c: c - 1, color: color, newColor: newColor)
        }
        if (r + 1 < updatedImage.count) {
            updatedImage = applyDFS(image: updatedImage, r: r + 1, c: c, color: color, newColor: newColor)
        }
        if (c + 1 < updatedImage[0].count) {
            updatedImage = applyDFS(image: updatedImage, r: r, c: c + 1, color: color, newColor: newColor)
        }
    }
    return updatedImage
}

// 3. Longest Substring Without Repeating Characters

func lengthOfLongestSubstring(_ s: String) -> Int {
    var test: String = "";

    var maxLength: Int = -1

    if s.isEmpty {
        return 0
    }
    else if s.count == 1 {
        return 1
    }
    s.forEach { c in
        let current: String = String(c)

        if (test.contains(current)) {
            test = String(test.substring(from: test.index(after: test.firstIndex(of: c)!)))
        }
        test = test + String(c)
        maxLength = max(test.count, maxLength)
    }

    return maxLength
}

// 19. Remove Nth Node From End of List

public class ListNode2 {
    public var val: Int
    public var next: ListNode2?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode2?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode2?, _ n: Int) -> ListNode2? {
    var count: Int = 0
    var temp: ListNode2? = head
    var result: ListNode2? = head
    var resultListCount = 0
    while temp != nil {
        count += 1
        temp = temp?.next
    }
    count = count - n
    if count == 0 {
        return result?.next
    }
    while resultListCount < count - 1 {
        resultListCount += 1
        result = result?.next
    }
    result?.next = result?.next?.next

    return head
}

// 876. Middle of the Linked List

func middleNode(_ head: ListNode2?) -> ListNode2? {
    var c: Int = 0
    var temp: ListNode2? = head
    var result: ListNode2? = head
    while temp != nil {
        c += 1
        temp = temp?.next
    }
    c = c / 2
    while true {
        if c >= 1{
            result = result?.next
            c -= 1
        } else {
            break
        }
    }
    return result
}

// 557. Reverse Words in a String III

func reverseWordsIII(_ s: String) -> String {
    var result: String = ""
    var word: String = ""
    s.forEach { character in
        if character == " " {
            result = result + String(word.reversed()) + " "
            word = ""
        } else {
            word = word + String(character)
        }
    }
    if result.count != s.count {
        result = result + String(word.reversed())
    }
    return result
}

// 344. Reverse String

func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = 0
    if s.count % 2 == 0{
        left = s.count / 2
        right = s.count / 2 + 1
    } else {
        left = (s.count - 1) / 2
        right = (s.count + 1) / 2 + 1
    }
    left -= 1
    right -= 1
    while left >= 0 {
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        left -= 1
        right += 1
    }
}

// 1704. Determine if String Halves Are Alike

func halvesAreAlike(_ s: String) -> Bool {
    var firstHalfNoOfVowel = 0
    var secondHalfNoOfVowel = 0
    var index = 0
    var vowelArray = ["a", "e", "o", "i", "u", "A", "E", "O", "I", "U"]
    s.forEach { character in
        if index < s.count / 2 {
                        if vowelArray.contains("\(character)") {
                            firstHalfNoOfVowel += 1
                        }
                    } else {
                        if vowelArray.contains("\(character)") {
                            secondHalfNoOfVowel += 1
                        }
                    }
        index += 1
    }
    return firstHalfNoOfVowel == secondHalfNoOfVowel
}

// 167. Two Sum II - Input Array Is Sorted

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var leftIndex = 0
    var rightIndex = numbers.count - 1
    while leftIndex != rightIndex {
        if numbers[leftIndex] + numbers[rightIndex] == target {
            return [leftIndex + 1, rightIndex + 1]
        } else if numbers[leftIndex] + numbers[rightIndex] > target {
            rightIndex -= 1
        } else {
            leftIndex += 1
        }
    }
    return []
}

// 189. Rotate Array

func rotate(_ nums: inout [Int], _ k: Int) {
    var inputK = k
    inputK = inputK % nums.count
    nums = swap(arr: nums, start: 0, end: nums.count - 1)
    nums = swap(arr: nums, start: 0, end: inputK - 1);
    nums = swap(arr: nums, start: inputK, end: nums.count - 1)
}

func swap(arr: [Int], start: Int, end: Int) -> [Int]{
    var array = arr
    var startIndex = start
    var endIndex = end
    while startIndex < endIndex {
        let temp = array[startIndex]
        array[startIndex] = array[endIndex]
        array[endIndex] = temp
        startIndex += 1
        endIndex -= 1
    }
    return array
}

// 977. Squares of a Sorted Array

func sortedSquares(_ nums: [Int]) -> [Int] {
    var squaredArray: [Int] = []
    nums.forEach { number in
        squaredArray.append(number * number)
    }
    return squaredArray.sorted()
}

// 35. Search Insert Position

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var lowerIndex = 0
    var upperIndex = nums.count - 1
    while lowerIndex <= upperIndex {
        let currentIndex = (lowerIndex + upperIndex)/2
        if nums[currentIndex] == target {
            return currentIndex
        } else if nums[currentIndex] > target {
            upperIndex = currentIndex - 1
        } else if nums[currentIndex] < target {
            lowerIndex = currentIndex + 1
        }
    }
    return lowerIndex
}

// 278. First Bad Version

// The knows API is defined in the parent class VersionControl. Here has a dummy method
func isBadVersion(_ version: Int) -> Bool{return true}

func firstBadVersion(_ n: Int) -> Int {
    var s: Int = 1
    var end: Int = n
    var ans: Int = 0
    var mid: Int = s + (end - s) / 2
    while s <= end {
        let flag = isBadVersion(mid)
        if flag == false {
            s=mid+1
        }
        if flag == true {
            end=mid-1
            ans=mid
        }
        mid = s + (end - s) / 2
    }
    return ans
}

// 7. Reverse Integer

func reverse(_ x: Int) -> Int {
    var inputValue = x
    var reversedInt = 0
    var digit = 0
    let positiveConstraint = 2147483647
    let negativeConstraint = -2147483648

    while inputValue != 0 {
        digit = inputValue % 10
        inputValue = inputValue / 10
        if reversedInt > positiveConstraint / 10 || (reversedInt == positiveConstraint / 10 && digit > 7) {
            return 0
        }
        if (reversedInt < negativeConstraint / 10 || (reversedInt == negativeConstraint / 10 && digit < -8)) {
            return 0
        }
        reversedInt = reversedInt * 10 + digit
    }
    return reversedInt
}

// 704. Binary Search

func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var lowerIndex = 0
    var upperIndex = nums.count - 1

    while (true) {
        let currentIndex = (lowerIndex + upperIndex)/2
        if(nums[currentIndex] == target) {
            return currentIndex
        } else if (lowerIndex > upperIndex) {
            return -1
        } else {
            if (nums[currentIndex] > target) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
}

// 12. Integer to Roman

func intToRoman(_ num: Int) -> String {
    var integerValue = num
    var numeralString = ""
    let mappingList: [(Int, String)] = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
    for i in mappingList {
        while (integerValue >= i.0) {
            integerValue -= i.0
            numeralString += i.1
        }
    }
    return numeralString
}

// 13. Roman to Integer

func romanToInt(_ s: String) -> Int {
    var inputRomanString = s
    var roman: [String : Int] = [:]
    roman["I"] = 1
    roman["V"] = 5
    roman["X"] = 10
    roman["L"] = 50
    roman["C"] = 100
    roman["D"] = 500
    roman["M"] = 1000
    inputRomanString = inputRomanString.replacingOccurrences(of: "IV", with: "IIII")
    inputRomanString = inputRomanString.replacingOccurrences(of: "IX", with: "VIIII")
    inputRomanString = inputRomanString.replacingOccurrences(of: "XL", with: "XXXX")
    inputRomanString = inputRomanString.replacingOccurrences(of: "XC", with: "LXXXX")
    inputRomanString = inputRomanString.replacingOccurrences(of: "CD", with: "CCCC")
    inputRomanString = inputRomanString.replacingOccurrences(of: "CM", with: "DCCCC")
    var resultInt: Int = 0;
    for romanChar in inputRomanString {
        resultInt += roman["\(romanChar)"]!
    }
    return resultInt
}

// 9. Palindrome Number

func isPalindrome(_ x: Int) -> Bool {
    var inputValue = x
    if inputValue < 0 || (inputValue % 10 == 0 && inputValue != 0) {
        return false;
    }

    var revertedNumber: Int = 0
    while inputValue > revertedNumber {
        revertedNumber = revertedNumber * 10 + inputValue % 10
        inputValue = inputValue / 10
    }
    return inputValue == revertedNumber || inputValue == revertedNumber/10
}

// 907. Sum of Subarray Minimums

func sumSubarrayMins(_ arr: [Int]) -> Int {
    var minimumSum: Int = 0
    var stack = Stack<Int>()
    let notExceedValue = 1000000007
    for index in 0...arr.count {
        while !stack.isEmpty && (index == arr.count || arr[stack.peek() ?? 0] >= arr[index]) {
            let mid: Int = stack.pop() ?? 0
            let leftBoundary: Int = stack.isEmpty ? -1 : stack.peek()!
            let rightBoundary: Int = index

            let count = (mid - leftBoundary) * (rightBoundary - mid) % notExceedValue

            minimumSum += (count * arr[mid]) % notExceedValue
            minimumSum %= notExceedValue
        }
        stack.push(index);
    }
    return minimumSum
}

protocol Stackable {
    associatedtype Element
    func peek() -> Element?
    mutating func push(_ element: Element)
    @discardableResult mutating func pop() -> Element?
}

extension Stackable {
    var isEmpty: Bool { peek() == nil }
}

struct Stack<Element>: Stackable where Element: Equatable {
    private var storage = [Element]()
    func peek() -> Element? { storage.last }
    mutating func push(_ element: Element) { storage.append(element)  }
    mutating func pop() -> Element? { storage.popLast() }
}

extension Stack: Equatable {
    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool { lhs.storage == rhs.storage }
}

extension Stack: CustomStringConvertible {
    var description: String { "\(storage)" }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Self.Element...) { storage = elements }
}

// 1. Two Sum

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var firstNumIndex = 0
    var secondNumIndex = 0
    var resultArray: [Int] = []
    for index in 0...(nums.count - 2) {
        for secondIndex in (index+1)...(nums.count - 1) {
            if (nums[index] + nums[secondIndex]) == target {
                firstNumIndex = index
                secondNumIndex = secondIndex
            }
        }
    }
    resultArray.append(firstNumIndex)
    resultArray.append(secondNumIndex)
    return resultArray
}
