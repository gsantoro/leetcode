class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        ans = deque()
        
        n = len(nums)
        if n < 1:
            return ans
        
        lo, hi = 0, n - 1
        while lo <= hi:
            square_lo = nums[lo] ** 2
            square_hi = nums[hi] ** 2
            if square_lo > square_hi:
                ans.appendleft(square_lo)
                lo += 1
            else:
                ans.appendleft(square_hi)
                hi -= 1
        return ans