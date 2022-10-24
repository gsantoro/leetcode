class Solution:
    def findTheDifference(self, s: str, t: str) -> str:
        ans = {}
        for c in s:
            if c not in ans:
                ans[c] = 0
            ans[c] += 1
        
        for c in t:
            if c not in ans:
                return c
            ans[c] -= 1
            if ans[c] == 0:
                del ans[c]
                
        return ""