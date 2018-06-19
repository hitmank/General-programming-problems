import java.util.Scanner;
class Fractional_Knapsack{
public static void main(String args[]){
        int array[][] = new int [2][20];
        double profit = 0.0;
		/*
			*Inputs
			*2d Array -> [0][...] = Weights
					  -> [1][...] = Profit
			*max_capacity = maximum weight allowed in knapsack
		*/
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Number of Items:");
        int num = sc.nextInt();
        System.out.println("Enter Weights:");
        for(int i = 0; i < num; i ++){
            array[0][i] = sc.nextInt();
        }
        System.out.println("Enter Profit:");

        for(int i = 0; i < num; i ++){
            array[1][i] = sc.nextInt();
        }
        System.out.println("Enter max capacity:");

        int max_capacity = sc.nextInt();

        //Problem Solving

        //Create (profit/weight) array
        double profit_weight_array[] = new double[7];
        for (int i = 0; i < num; i ++) {
            profit_weight_array[i] = (double)array[1][i] / (double)array[0][i];
        }

        int current_weight = 0;
        while(current_weight < max_capacity){
            double max = -10000;
            int max_index = 0;
            for (int i=0    ; i<num; i++) {
                if(profit_weight_array[i] > max){
                    max = profit_weight_array[i];
                    max_index = i;
                }
            }
            if (array[0][max_index] + current_weight <= max_capacity) {
                current_weight = current_weight + array[0][max_index];
                profit += array[1][max_index];
                profit_weight_array[max_index] = -999999;
            }
            else{
                double fraction = ((double)array[0][max_index] - ((double)((array[0][max_index] + current_weight) - max_capacity)))/(double)array[0][max_index];
                profit += fraction * array[1][max_index];
                break;
            }
        }

        System.out.println("The max profit is : " + profit);
    }

}