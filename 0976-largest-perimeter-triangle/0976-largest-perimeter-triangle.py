class Solution:
    def largestPerimeter(self, nums: List[int]) -> int:
        nums = sorted(nums)
        n = len(nums)
        i, j, k = n - 3, n - 2, n - 1
        while k >= 2: 
            n1, n2, n3 = nums[i], nums[j], nums[k]
            if n1 + n2 > n3:
                return n1 + n2 + n3
            
            while i > 0:
                j -= 1
                i -= 1
                
                n1, n2, n3 = nums[i], nums[j], nums[k]
                if n1 + n2 > n3:
                    return n1 + n2 + n3
            k -= 1
            j = k - 1
            i = k - 2
        return 0
        