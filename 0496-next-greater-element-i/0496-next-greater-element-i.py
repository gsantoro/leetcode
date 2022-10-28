from collections import deque
class Solution:
    def find_max(self, n, l, r, nums) -> int:
        for i in range(l, r):
            if nums[i] > n:
                return nums[i]
        return -1
            
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        # n1 = [4, 1, 2]
        # n2 = [1, 3, 4, 2, 5]
        
        n1 = len(nums1)
        n2 = len(nums2)
        
        # n1_dict = {4:0, 1:1, 2:2}
        n1_dict = {}
        for i, n in enumerate(nums1):
            n1_dict[n] = i
        
        # ans = [0, 0, 0]
        ans = [-1] * n1
    
        for i, n in enumerate(nums2):
            if n in n1_dict.keys():
                ans[n1_dict[n]] = self.find_max(n, i+1, n2, nums2)
        return ans
        
        
        
    