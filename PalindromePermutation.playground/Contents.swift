func checkIfPermutationOfPalindrome(_ inputString: String)->Bool{
    var numberOfOddCharacters = 0
    let arrayForm = Array(inputString)
    var characterCounter = Dictionary<String.Element, Int>()
    for char in arrayForm{
        if let count = characterCounter[char]{
            characterCounter[char] = count + 1
            if count % 2 == 0{
                numberOfOddCharacters = numberOfOddCharacters + 1
            }
            else{
                numberOfOddCharacters = numberOfOddCharacters - 1
            }
        }
        else{
            characterCounter[char] = 1
            numberOfOddCharacters = numberOfOddCharacters + 1
        }
    }
    return numberOfOddCharacters <= 1
}

print(checkIfPermutationOfPalindrome("ababababa"))
