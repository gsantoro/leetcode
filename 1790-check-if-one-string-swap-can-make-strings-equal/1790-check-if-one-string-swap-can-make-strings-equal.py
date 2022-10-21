class Solution:
    def add_char(self, diff, c, f):
        if c not in diff:
            diff[c] = 0
        diff[c] += f
        
        if diff[c] == 0:
            del diff[c]
        
    def areAlmostEqual(self, s1: str, s2: str) -> bool:
        n1 = len(s1)
        n2 = len(s2)
        
        if n1 != n2:
            return False
        
        diff_count = 0
        diff = {}
        for i in range(n1):
            if s1[i] != s2[i]:
                diff_count += 1
                
                self.add_char(diff, s1[i], 1)
                self.add_char(diff, s2[i], -1)
            
            if diff_count > 2:
                return False
        return len(diff) == 0