class Solution:
    def intersection(self, nums: List[List[int]]) -> List[int]:
        ans = []
        n = len(nums)
        if n < 1:
            return ans
        
        max_value = 1000
        counter = [0] * (max_value + 1) # extra value to count for 0 (not accepted value)
        
        for l in nums:
            for num in l:
                counter[num] += 1
        
        for num in range(1, max_value + 1):
            if counter[num] == n:
                ans.append(num)
        return ans