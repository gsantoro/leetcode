class NumArray:

    def __init__(self, nums: List[int]):
        n = len(nums)
        
        _sum = [0] * (n + 1)
        for i in range(1, n + 1):
            _sum[i] = _sum[i-1] + nums[i-1]
            
        self._sum = _sum
        
        
    # nums =    [1, 2, 3, 4]
    # _sum = [0, 1, 3, 6, 10]
    # right = 3 (element: 4)
    # left  = 1 (element: 2)

    def sumRange(self, left: int, right: int) -> int:
        return self._sum[right+1] - self._sum[left]


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)