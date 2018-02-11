class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var numberOfInversions = 0
        var inversionIndex = 0
        
        for (index, value) in nums.enumerated(){
            if(index == nums.count-1){
                if(numberOfInversions == 0){
                    return true
                }
                else{
                    if((inversionIndex == 0) || (inversionIndex == nums.count-2)) {
                        return true
                    }
                    else{
                        if(nums[inversionIndex+1] >= nums[inversionIndex-1]){
                            return true
                        }
                        if(nums[inversionIndex+2] >= nums[inversionIndex]){
                            return true
                        }
                        return false;
                    }
                }
            }
            if(value > nums[index+1]){
                numberOfInversions = numberOfInversions + 1
                if(numberOfInversions > 1){
                    return false;
                }
                inversionIndex = index
            }
        }
        return true;
    }
}
