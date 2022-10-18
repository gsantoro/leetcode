class Solution:
    def hasAlternatingBits(self, n: int) -> bool:
        last = n & 1
        n >>= 1
        
        while n > 0:
            bit = n & 1
            if last == bit:
                return False
            last = bit
            n >>= 1
            
        return True