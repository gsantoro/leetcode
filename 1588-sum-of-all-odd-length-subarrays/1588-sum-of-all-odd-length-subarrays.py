class Solution:
    def sumOddLengthSubarrays(self, arr: List[int]) -> int:
        n = len(arr)
        
        p_sum = [0] * (n + 1)
        # n = 5
        #   [1, 4, 2,  5,  3]
        #[0, 1, 5, 7, 12, 15]
        # 0, 1, 2, 3,  4,  5
        for i in range(1, n + 1):
            p_sum[i] = p_sum[i-1] + arr[i-1]
        
        ans = p_sum[-1]  # sum of all subarray with size = 1
        for s in range(3, n+1, 2):
            # s = 5
            # i = [0, 1, 2]
            for i in range(0, n - s + 1):
                ans += p_sum[i+s] - p_sum[i]  # i = 0, 15
        return ans
            
                
                