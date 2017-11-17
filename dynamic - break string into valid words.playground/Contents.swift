func breakStringIntoWords(inputString: String, dictionary : Set<String>)->[String]?{
    let length = inputString.count
    var matrix : [[Int]] = [[Int]].init(repeating: [Int].init(repeating: -1, count: length), count: length)
    
    for span in 1...length{
        for i in 0...length-span{
            let subString = inputString[String.Index.init(encodedOffset: i)...String.Index.init(encodedOffset: i+span-1)]
            if dictionary.contains(String(subString)) {
                matrix[i][i+span-1] = i
                continue
            }
            
            for splitPoint in i+1...i+span{
                if matrix[i][splitPoint-1] != -1 && matrix[splitPoint][i+span-1] != -1 {
                    matrix[i][i+span-1] = splitPoint
                    break
                }
            }
        }
    }
    
//    for row in matrix{
//        print(row)
//    }
    
    
    if matrix[0][length-1] == -1 {
        return nil
    }
    else{
        
        return ["Possible"]
    }
}


let input = "aoce"
let dictOfValidWords :Set<String> = ["this","god","ace","i","a","am"]

if let splitString = breakStringIntoWords(inputString: input, dictionary: dictOfValidWords){
    print(splitString)
}
else{
    print("No split possible")
    print("And thats not right!")
}







