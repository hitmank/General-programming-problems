class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        if(S == ""){
            return [""]
        }
        var answer = [String]()
        var inputString = Array(S)
        
        
        for char in inputString{
            if((char >= "0") && (char <= "9")){
                var newAnswer = [String]()
                if(answer.isEmpty){
                    answer.append(String(char))
                    
                }
                else{
                    for var eachAnswer in answer {
                        var update = eachAnswer
                        update.append(char)
                        newAnswer.append(String(update))
                    }
                    answer = newAnswer
                }
            }
            else{
                var newAnswer = [String]()
                if(answer.isEmpty){
                    answer.append(String(char).uppercased())
                    answer.append(String(char).lowercased())
                    
                }
                else{
                    for var eachAnswer in answer{
                        var copy1 = eachAnswer
                        var copy2 = eachAnswer
                        copy1.append(Character(String(char).uppercased()))
                        copy2.append(Character(String(char).lowercased()))
                        newAnswer.append(copy1)
                        newAnswer.append(copy2)
                    }
                    
                    answer = newAnswer
                }
            }
        }
        return answer
    }
    
    
}
