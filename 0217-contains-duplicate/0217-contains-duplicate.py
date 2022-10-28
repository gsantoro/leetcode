class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        nums = sorted(nums)
        prev = - math.inf
        for n in nums:
            if prev == n:
                return True
            prev = n
        return False