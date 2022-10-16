class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        n = len(nums)
        ans = [0] * n
        if n < 1:
            return ans
        
        lo, hi = 0, n - 1
        i = n - 1
        while i >= 0:
            square_lo = nums[lo] ** 2
            square_hi = nums[hi] ** 2
            if square_lo > square_hi:
                ans[i] = square_lo
                lo += 1
            else:
                ans[i] = square_hi
                hi -= 1
            
            i -= 1
        return ans