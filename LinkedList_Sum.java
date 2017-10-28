public class LinkedList_Sum {
    static class ListNode {
      int val;
      ListNode next;
      ListNode(int x) { val = x; }
  }
    static ListNode addTwoNumbers(ListNode l1, ListNode l2) {

        boolean carry = false;
        ListNode finalAns = null;
        ListNode curr_l1 = l1;
        ListNode curr_l2 = l2;
        ListNode currentNode = null;

        while (curr_l1 != null || curr_l2 != null){

            int val1,val2,val = 0;
            val1 = (curr_l1 != null)? curr_l1.val : 0;
            val2 = (curr_l2 != null)? curr_l2.val : 0;

            val = val1 + val2;
            if (carry){
                val += 1;
                carry = false;
            }

            if (val / 10 > 0){
                carry = true;
            }

            if (currentNode == null){
                currentNode = new ListNode(val % 10);
                finalAns = currentNode;
            }
            else{
                currentNode.next = new ListNode(val % 10);
                currentNode = currentNode.next;
            }

            curr_l1 = (curr_l1 != null)? curr_l1.next : null;
            curr_l2 = (curr_l2 != null)? curr_l2.next : null;

        }

        if (carry){
            currentNode.next = new ListNode(1);
        }

        return finalAns;
    }
    public static void main (String args[]){

        ListNode a1 = new ListNode(2);
        ListNode a2 = new ListNode(4);
        ListNode a3 = new ListNode(3);

        ListNode b1 = new ListNode(5);
        ListNode b2 = new ListNode(6);
        ListNode b3 = new ListNode(4);

        a1.next = a2;
        a2.next = a3;
        b1.next = b2;
        b2.next = b3;

        System.out.print(addTwoNumbers(a1,b1));
    }
}
