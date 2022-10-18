class Solution:
    def subtractProductAndSum(self, n: int) -> int:
        p = 1
        s = 0
        while n > 0:
            n, d = divmod(n, 10)
            p *= d
            s += d
        return p - s