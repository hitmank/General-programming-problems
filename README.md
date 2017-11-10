# General-programming-problems
  The usual interview problems and some more!
  
# 1. Two Sum Problem
    Given an array of integers, return indices of the two numbers such that they add up to a specific target.

    You may assume that each input would have exactly one solution, and you may not use the same element twice.

    Example:
    Given nums = [2, 7, 11, 15], target = 9,

    Because nums[0] + nums[1] = 2 + 7 = 9,
    return [0, 1].
    
# 2. Multiply Strings
    Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.
    
    Note:
    
    The length of both num1 and num2 is < 110.
    Both num1 and num2 contains only digits 0-9.
    Both num1 and num2 does not contain any leading zero.
    You must not use any built-in BigInteger library or convert the inputs to integer directly.
    
# 3. Linked List Addition
    You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

    You may assume the two numbers do not contain any leading zero, except the number 0 itself.

    Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 0 -> 8
    
# 4. Longest Substring without duplicates
    Given a string, find the length of the longest substring without repeating characters.

    Examples:

    Given "abcabcbb", the answer is "abc", which the length is 3.

    Given "bbbbb", the answer is "b", with the length of 1.

    Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a    subsequence and not a substring.

# 5. Moving Zero's to the End of an Array (Inplace and extra array)
    Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

    For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].

    Note:
    You must do this in-place without making a copy of the array.
    Minimize the total number of operations.

# 6. 3 Sum Problem
    Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

    Note: The solution set must not contain duplicate triplets.

    For example, given array S = [-1, 0, 1, 2, -1, -4],

    A solution set is:
    [
      [-1, 0, 1],
      [-1, -1, 2]
    ]

# 7. Convert Binary tree to Doubly Linked List (Inorder)
    Given a Binary Tree (Bt), convert it to a Doubly Linked List(DLL). The left and right pointers in nodes are to be used as previous and next pointers respectively in converted DLL. The order of nodes in DLL must be same as Inorder of the given Binary Tree. The first node of Inorder traversal (left most node in BT) must be head node of the DLL.

# 8. Quicksort Algorithm

# 9. Mergesort Algorithm

# 10. Graph - Depth first search (Recursive and iterative)
    Using the call stack (recursion) or custom Stack struct

# 11. Graph - BFS
    Using custom Queue

# 12. Topological ordering in a Directed Acyclic Graph (DAG)
    Topological sorting for Directed Acyclic Graph (DAG) is a linear ordering of vertices such that for every directed edge uv, vertex u comes before v in the ordering. Topological Sorting for a graph is not possible if the graph is not a DAG.
    In DFS, we print a vertex and then recursively call DFS for its adjacent vertices. In topological sorting, we need to print a vertex before its adjacent vertices.
    Using cusotm stack

# 13. Insertion Sort

# 14. Selection Sort

# 15. Longest path in DAG
    Given a Weighted Directed Acyclic Graph (DAG) and a source vertex s in it, find the longest distances from s to all other vertices in the given graph.

    The longest path problem for a general graph is not as easy as the shortest path problem because the longest path problem doesn’t have optimal substructure property. In fact, the Longest Path problem is NP-Hard for a general graph. However, the longest path problem has a linear time solution for directed acyclic graphs. The idea is similar to linear time solution for shortest path in a directed acyclic graph., we use Tological Sorting.
    
# 16.Connected Components in undirected Graph
    Finding connected components for an undirected graph is an easier task. We simple need to do either BFS or DFS starting from every unvisited vertex, and we get all strongly connected components. Below are steps based on DFS.

    1) Initialize all vertices as not visited.
    2) Do following for every vertex 'v'.
           (a) If 'v' is not visited before, call DFSUtil(v)
           (b) Print new line character

    DFSUtil(v)
    1) Mark 'v' as visited.
    2) Print 'v'
    3) Do following for every adjacent 'u' of 'v'.
         If 'u' is not visited, then recursively call DFSUtil(u)

# 17.Least Common Ancestor in a Binary Tree
    Let T be a rooted tree. The lowest common ancestor between two nodes n1 and n2 is defined as the lowest node in T that has both n1 and n2 as descendants (where we allow a node to be a descendant of itself).

    The LCA of n1 and n2 in T is the shared ancestor of n1 and n2 that is located farthest from the root.

