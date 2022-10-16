from collections import Counter
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        ans = 0
        for word in words:
            if self.valid(word, chars):
                ans += len(word)
        return ans
    
    def count(self, chars: str) -> dict:
        ans = {}
        for c in chars:
            if c not in ans:
                ans[c] = 0
            ans[c] += 1
        return ans
        
    def valid(self, word: str, chars: str) -> bool:
        seen = self.count(chars)
        for c in word:
            if c not in seen:
                return False
            seen[c] -= 1
            if seen[c] == 0:
                del seen[c]
        return True