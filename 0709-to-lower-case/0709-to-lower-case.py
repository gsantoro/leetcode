## 1. trivial with lower function
# class Solution:
#     def toLowerCase(self, s: str) -> str:
#         return s.lower()

class Solution:
    def toLowerCase(self, s: str) -> str:
        a, z = ord("A"), ord("Z")
        ans = []
        for c in s:
            c_digit = ord(c)
            if a <= c_digit <= z:
                ans.append(chr(c_digit + 32))
            else:
                ans.append(c)
        return "".join(ans)