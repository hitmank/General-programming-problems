import java.util.HashMap;
import java.util.Map;

public class twoSum {

    //Brute Force
    //Iterate the whole array, for each element
    //Time complexity = O(n^2)
    //Space complexity = O(1)
    public static int[] getIndexesForSum_BruteForce(int[] arr, int target){

        for (int i=0;i<arr.length-1;i++){
            int complement = target - arr[i];
            for (int j=i+1;j<arr.length;j++){
                if (arr[j] == complement){
                    return new int[] {i,j};
                }
            }
        }


        return new int[] {};

    }
    //2 pass hash
    //Iterate the whole array, for each element - store the element and its index into a hashMap
    //Iterate array again, look for the compliment of each element.
    // 2 full iterations in worse case = O(n) + O(n). Each lookup in the hashMap is O(1)
    //Time complexity = O(n)
    //Space complexity = O(n) = because of hash map
    public static int[] getIndexesForSum_2PassHash(int[] arr, int target){

        HashMap<Integer,Integer> elementsMap = new HashMap<>();
        for (int i=0;i<arr.length;i++){
            elementsMap.put(arr[i],i);
        }
        for (int i=0;i<arr.length;i++){
            int compliment = target - arr[i];
            if (elementsMap.containsKey(compliment) && elementsMap.get(compliment) != i){
                return new int[] {i,elementsMap.get(compliment)};
            }
        }
        return new int[] {};
    }
    //1 pass hash
    //Iterate the whole array, for each element - look for the compliment in the Hash Map.
    // If found, return. Else, store this element in the Map and proceed.
    // 1 full iteration in worse case = O(n). Each lookup in the hashMap is O(1)
    //Time complexity = O(n)
    //Space complexity = O(n) = because of hash map
    public static int[] getIndexesForSum_1PassHash(int[] arr, int target){

        HashMap<Integer,Integer> elementsMap = new HashMap<>();
        for (int i=0;i<arr.length;i++){
            int compliment = target - arr[i];
            if (elementsMap.containsKey(compliment) && elementsMap.get(compliment) != i){
                return new int[] {elementsMap.get(compliment),i};
            }
            else{
                elementsMap.put(arr[i],i);
            }
        }
        return new int[] {};
    }

    public static void main(String args[]){

        int[] input = new int[] {12,5,30,2,3,6,9,4,22,21};

        int answer[] = getIndexesForSum_BruteForce(input,32);
        System.out.println("Brute Force :");
        System.out.println(answer[0] + "," + answer[1]);
        answer = getIndexesForSum_2PassHash(input,32);
        System.out.println("2-Pass Hash :");
        System.out.println(answer[0] + "," + answer[1]);
        answer = getIndexesForSum_1PassHash(input,32);
        System.out.println("1-Pass Hash :");
        System.out.println(answer[0] + "," + answer[1]);




    }
}
