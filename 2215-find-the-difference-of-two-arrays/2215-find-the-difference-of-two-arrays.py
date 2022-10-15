class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        max_value = 1000
        
        # bitmap with integer to check for a num in a list
        counter = [0] * (max_value * 2 + 1)
        
        for n1 in nums1:
            n = n1 + max_value # shift to store negative numbers
            counter[n] |= 1  # n1 seen in nums1
            
        for n2 in nums2:
            n = n2 + max_value # shift to store negative numbers
            counter[n] |= 2 # n2 seen in nums2
            
        ans = [[], []]
        for i, c in enumerate(counter):
            n = i - max_value # shift back to restore original value
            if c == 3 or c == 0: # element in both nums1 and nums2 or not seen => skip
                continue
            if c == 1:
                ans[0].append(n)
            elif c == 2:
                ans[1].append(n)
        return ans
                