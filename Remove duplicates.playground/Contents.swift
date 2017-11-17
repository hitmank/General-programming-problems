func removeDuplicates(from input: inout String){
    let length = input.count
    if length <= 1 {
        return
    }
    var ptr = 1;
    for i in 1...length-1{
        var foundDuplicate = false
        for j in 0...ptr-1{
            if input.characters[input.index(input.startIndex, offsetBy: j)] == input.characters[input.index(input.startIndex, offsetBy: i)]{
                foundDuplicate = true
                break
            }
        }
        if !foundDuplicate {
           var arrStr = Array(input.characters)
           arrStr[ptr] = arrStr[i]
           input = String(arrStr)
           ptr += 1
        }
        
    }
    let difference = length - ptr
    if difference > 0{
        input = String(input.dropLast(difference))
    }
}

var string : String = "abcsarccd"
let expectedOutput : String = "abcsrd"

print("The original string : ", string)
print("The expected string : ", expectedOutput)

removeDuplicates(from: &string)

print("The modified string : ", string)

if string == expectedOutput{
    print("Yes, you are correct!")
}
else{
    print("Wrong!")
}

