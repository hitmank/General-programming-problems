public class CoinCombinstions {
    public static void main(String args[]){
        int coins[] = {1,2,3,6};
        int amount = 41;
        System.out.println(dp_numberOfCombinations(coins,amount));
        System.out.println(recursive_numberOfCombinations(coins,coins.length,amount));
    }

    public static int dp_numberOfCombinations(int coins[], int amt){
        int arr[] = new int[amt + 1];
        arr[0] = 1;
        for (int j = 1; j < arr.length; j++) {
            arr[j] = 0;
        }
        for (int i = 0; i < coins.length; i++) {
            int currentSum = 0;
            for (int j = 1; j < arr.length; j++) {
                if(currentSum + coins[i] <= j){
                    arr[j] += arr[j-coins[i]];
                }
            }
        }
        return arr[arr.length-1];
    }

    public static int recursive_numberOfCombinations(int coins[],int m,int amt){
        if(amt == 0){
            return 1;
        }

        if(amt < 0){
            return 0;
        }

        if(m <= 0 && amt >= 1){
            return 0;
        }

        return recursive_numberOfCombinations(coins,m-1,amt) + recursive_numberOfCombinations(coins,m,amt-coins[m-1]);
    }
}
