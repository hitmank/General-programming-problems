public class MultiplyStrings {
    public static String multiply(String num1, String num2) {

        //Create final string.
        int[] answer = new int[num1.length()+num2.length()];
        //When you multiply 2 numbers, the final result can have a max size of number1.count + number2.count
        for (int i=0;i<num1.length()+num2.length();i++){
            answer[i] = 0;
        }

        //Basic Algo is this : When you multiple a digit at the ith position of one number and another digit at the jth position of the other number,
        //that result contributes to the (i+j+1)th position of the final result.
        //We start multiplying from the end, because least significant digit first.
        for (int i = num2.length()-1;i>=0;i--){
            int carry = 0;
            for (int j = num1.length()-1;j>=0;j--) {
                int val = answer[i + j + 1] + ((num1.charAt(j) - '0') * (num2.charAt(i) - '0')) + carry;
                carry = val / 10;
                answer[i+j+1] = val % 10;
            }
            answer[i] += carry;
        }

        StringBuilder builder = new StringBuilder();

        for (int i = 0;i<answer.length;i++){
            if (builder.length() == 0 && answer[i] == 0){
                continue;
            }
            else{
                builder.append(answer[i]);
            }
        }

        String finalAnswer = "0";
        if (builder.length() > 0){
            finalAnswer = builder.toString();
        }
        return finalAnswer;
    }
    public static void main(String args[]){
        System.out.println(multiply("135","25"));
    }

}
