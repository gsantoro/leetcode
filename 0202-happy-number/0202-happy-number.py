class Solution:
    def sum_digits(self, n: int) -> int:
        ans = 0
        while n > 0:
            n, d = divmod(n, 10)
            ans += d * d
        return ans
    
    def isHappy(self, n: int) -> bool:
        slow, fast = n, n
        while True:
            slow = self.sum_digits(slow)
            fast = self.sum_digits(self.sum_digits(fast))
            
            if slow == fast:
                break
        return slow == 1