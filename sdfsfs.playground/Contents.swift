func countMoves(numbers: [Int]) -> Int {
    
    let arraySum = numbers.reduce(0) { $0 + $1 }
    let minValue = numbers.min()!
    return arraySum - numbers.count * minValue
}
    


print(countMoves(numbers: [5,6,8,8,5]))
