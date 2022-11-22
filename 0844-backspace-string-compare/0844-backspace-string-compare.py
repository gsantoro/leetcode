
class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        def process(chars):
            ans = []
            for c in chars:
                if c != "#":
                    ans.append(c)
                elif len(ans) > 0:
                    ans.pop()
            return ans
        
        return process(s) == process(t)
        