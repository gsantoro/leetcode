# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:
        head, tail = head, head
        
        # 1
        # H
        # T
        
        # 1, 2, 3, 4, 5
        #       H
        #             T
        
        # 1, 2, 3, 4, 5, 6
        #          H
        #                  T
        while tail and tail.next:
            head = head.next
            tail = tail.next.next
        return head