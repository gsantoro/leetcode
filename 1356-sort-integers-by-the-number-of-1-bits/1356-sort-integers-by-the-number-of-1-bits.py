class Solution:
    def sortByBits(self, arr: List[int]) -> List[int]:
        def count_bits(n: int) -> int:
            ans = 0
            a = n
            while a > 0:
                a = a & (a-1)
                ans += 1
            return (ans, n)
            
        return sorted(arr, key=count_bits)