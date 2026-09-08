/*
 You are given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
  

 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.
  

 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    // loop over the array
    // if currentNumber < target -> store its index as a target add up element
    //  then check if the current stored plus the next number is equal to the target
    //  if firstCandidate + nextCandidate = target -> result = [firstCandidateIndex, secondCandidateIndex]
    
    var secondCandidate = 0
    var result: [Int] = []
    
    for (index, element) in nums.enumerated() {
        nums.map {
            let secondCandidateIndex = nums.firstIndex(of: $0)
            
            if index != secondCandidateIndex && result.count < 2 {
                let addition = element + $0
                
                if addition == target {
                    result.append(index)
                    
                    if let secondIndex = nums.firstIndex(of: $0) {
                        result.append(secondIndex)
                    }
                }
            }
        }
    }
    
    return result
}

let sample_00 = [2, 7, 11, 15]
let target_00 = 9
//print(twoSum(sample_00, target_00))

let sample_01 = [3, 2, 4]
let target_01 = 6
//print(twoSum(sample_01, target_01))

let sample_02 = [3, 3]
let target_02 = 6
//print(twoSum(sample_02, target_02))


func twoSumB(_ nums: [Int], _ target: Int) -> [Int] {
    let n = nums.count

    for i in 0 ..< n {
        for j in i + 1 ..< n {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }

    return []
}


print(twoSumB(sample_00, target_00))
print(twoSumB(sample_01, target_01))
print(twoSumB(sample_02, target_02))
