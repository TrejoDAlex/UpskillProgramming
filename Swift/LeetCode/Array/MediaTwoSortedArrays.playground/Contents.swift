/*
 4. Median of Two Sorted Arrays
 Hard
 Topics
 premium lock icon
 Companies
 
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

 The overall run time complexity should be O(log (m+n)).

 Example 1:

 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 
 Example 2:

 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
  

 Constraints:

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106
 
 The median of an array is the middle value after you sort the array in ascending order
 */

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let divider = nums1.count + nums2.count
    
    let nums1Total = nums1.reduce(0, { x, y in
        x + y
    })
    
    let nums2Total = nums2.reduce(0, { x, y in
        x + y
    })
    
    return Double((nums1Total + nums2Total)) / Double(divider)
}

let nums1 = [1,3], nums2 = [2]
//print(findMedianSortedArrays(nums1, nums2))

let nums3 = [1,2], nums4 = [3,4]
//print(findMedianSortedArrays(nums3, nums4))

let nums5 = [2,2,4,4], nums6 = [2,2,2,4,4]  // 12 + 14 = 26 -> 26/9 = 2.88889
//print(findMedianSortedArrays(nums5, nums6))


func findMedianSortedArraysB(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var n1 = nums1
    var n2 = nums2

    if n1.count > n2.count {
        print("swap(&n1, &n2): \(n1) <-> \(n2) ")
        swap(&n1, &n2)
    }

    let m = n1.count
    print("m: \(m)")
    let n = n2.count
    print("n: \(n)")
    let count = m + n
    print("count: \(count)")
    let mid = count / 2
    print("mid: \(mid)")

    var l = 0
    print("l: \(l)")
    var r = m
    print("r: \(r)")

    while l <= r {
        let i = (l + r) / 2
        print("i: \(i)")
        let j = mid - i
        print("j: \(j)")
        
        let n1L = i > 0 ? n1[i - 1] : Int.min
        print("n1L: \(n1L)")
        let n1R = i < m ? n1[i] : Int.max
        print("n1R: \(n1R)")
        let n2L = j > 0 ? n2[j - 1] : Int.min
        print("n2L -> n2[j - 1]: \(n2[j - 1]), j:\(j)")
        let n2R = j < n ? n2[j] : Int.max
        print("n2R: \(n2R)")

        if n1L <= n2R && n2L <= n1R {
            print("count % 2 -> \(count % 2)")
            if count % 2 == 0 {
                print("count % 2 == 0 -> \(Double(max(n1L, n2L) + min(n1R, n2R)) / 2.0)")
                return Double(max(n1L, n2L) + min(n1R, n2R)) / 2.0
            } else {
                print("count % 2 != 0 -> \(Double(min(n1R, n2R)))")
                return Double(min(n1R, n2R))
            }
        } else if n1L > n2R {
            r = i - 1
            print("n1L > n2R -> r: \(r)")
        } else {
            l = i + 1
            print("n1L < n2R -> l: \(l)")
        }
    }

    return 0.0
}

print(findMedianSortedArraysB(nums5, nums6))
