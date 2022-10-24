class Solution:
    def findTheDifference(self, s: str, t: str) -> str:
        #sol 1. with extra space
#         ans = {}
#         for c in s:
#             if c not in ans:
#                 ans[c] = 0
#             ans[c] += 1
        
#         for c in t:
#             if c not in ans:
#                 return c
#             ans[c] -= 1
#             if ans[c] == 0:
#                 del ans[c]
#         return ""


        s = sorted(s)
        t = sorted(t)
        
        for i in range(len(t) - 1):
            if s[i] != t[i]:
                return t[i]
            
        return t[-1]