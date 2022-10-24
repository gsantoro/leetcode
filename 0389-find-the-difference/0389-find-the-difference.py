class Solution:
    def findTheDifference(self, s: str, t: str) -> str:
        #sol 1. with extra space
        # ans = {}
        # for c in s:
        #     if c not in ans:
        #         ans[c] = 0
        #     ans[c] += 1
        # for c in t:
        #     if c not in ans:
        #         return c
        #     ans[c] -= 1
        #     if ans[c] == 0:
        #         del ans[c]
        # return ""

        # #sol 2. with sorting
        # s = sorted(s)
        # t = sorted(t)
        # # check for diff character in "s"
        # for i in range(len(t) - 1):
        #     if s[i] != t[i]:
        #         return t[i]            
        # # otherwise it must be the last char in "t"
        # return t[-1]
        
        # sol3. with xor
        ans = 0
        for c in s:
            ans ^= ord(c)
        for c in t:
            ans ^= ord(c)
        return chr(ans)