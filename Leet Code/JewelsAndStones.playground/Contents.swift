class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var count_dict = [Character:Int]()
        var answer = 0
        for char in S{
            if(count_dict.keys.contains(char)){
                count_dict[char] = count_dict[char]! + 1
            }
            else{
                count_dict[char] = 1
            }
        }
        for jewel in J{
            if let count = count_dict[jewel]{
                answer = answer + count
            }
        }
        return answer;
    }
}
