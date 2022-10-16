from collections import Counter
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        ans = 0
        for word in words:
            if self.valid(word, chars):
                ans += len(word)
        return ans
        
    def valid(self, word: str, chars: str) -> bool:
        seen = Counter(chars)
        for c in word:
            if c not in seen or seen[c] <= 0:
                return False
            seen.subtract(Counter(c))
        return True