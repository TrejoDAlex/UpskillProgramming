let responseTimes = [100, 200, 150, 300]
let responseTimesB = [10, 50, 10, 10, 100]

func countResponseTimeRegressions(responseTimes: [Int]) -> Int {
    if responseTimes.count <= 0 || responseTimes.count > 1000 { return 0 }
    
    var currentSum = 0
    var loopCount = 0
    var count = 0
    
    for number in responseTimes {
        if loopCount == 0 {
            currentSum = number
            loopCount += 1
            continue
        }
        
        let average = currentSum/loopCount
        count = number > average ? addCount(count) : count
        currentSum += number
        loopCount += 1
    }
    
    return count
}

func addCount(_ count: Int) -> Int {
    count + 1
}

print("count: \(countResponseTimeRegressions(responseTimes: responseTimes))")

print("count: \(countResponseTimeRegressions(responseTimes: [0]))")

print("count: \(countResponseTimeRegressions(responseTimes: responseTimesB))")
