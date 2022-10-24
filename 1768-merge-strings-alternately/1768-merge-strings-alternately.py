from itertools import zip_longest
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        # sol1: one liner
        # return "".join(a + b for a, b in zip_longest(word1, word2, fillvalue=""))
        
        n1, n2 = len(word1), len(word2)
        n = max(n1, n2)
        ans = []
        for i in range(n):
            if i < n1:
                ans.append(word1[i])
            
            if i < n2:
                ans.append(word2[i])
        return "".join(ans)