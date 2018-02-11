func findLCS(_ string1:String, _ string2:String)->Int{
    var answer = 0
    
    var str1 = Array(string1)
    var str2 = Array(string2)
    let str1_length = str1.count
    let str2_length = str2.count
    var lcs_count = Array(repeating:Array(repeating:0,count:str2_length+1),count:str1_length+1)
 
    print(str1.reversed()[0])
    for i in 1...str1_length{
        for j in 1...str2_length{
            
            if(str1[i-1] == str2[j-1]){
                
                lcs_count[i][j] = lcs_count[i-1][j-1] + 1
                answer = max(answer,lcs_count[i][j])
            }
        }
    }
    var x = ""
    for i in 0...str1_length{
        for j in 0...str2_length{
            
            x += String(lcs_count[i][j])
            
        }
        print(x)
        x=""
    }
    
    return answer
}
findLCS("geeksforgeeks", "geeksquiz")
