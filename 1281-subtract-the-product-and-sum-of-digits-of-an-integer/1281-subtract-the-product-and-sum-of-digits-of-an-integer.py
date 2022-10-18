class Solution:
    def subtractProductAndSum(self, n: int) -> int:
        ans = 0
        prd = 1
        sum_ = 0
        while n > 0:
            n, d = divmod(n, 10)
            prd *= d
            sum_ += d
        return prd - sum_