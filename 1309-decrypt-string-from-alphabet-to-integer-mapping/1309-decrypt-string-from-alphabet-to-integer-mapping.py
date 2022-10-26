class Solution:
    def freqAlphabets(self, s: str) -> str:
        # input: 
        # 1326#
        #
        # 1
        # 13
        # 132    out = 1 => a
        #  326   out = 2 => c
        #   26#  out = 26 => z
        
        
        # input
        # 10#11#12
        # 1
        # 10
        # 10#         -> 10
        #    1
        #.   11
        #.   11#      -> 11
        #.      1
        #       12
        
        def i_to_c(c: int) -> str:
            return chr(c - 1 + ord('a'))
        
        def s_to_i(s) -> int:
            ans = 0
            for c in s:
                ans = ans * 10 + int(c)
            return ans
        
        def decrypt(s) -> str:
            return i_to_c(s_to_i(s))
        
        res = []
        i = 0
        n = len(s)
        q = deque()
        while i in range(n):
            q.append(s[i])
            i += 1
            
            if len(q) < 3:
                continue
                
            if q[-1] == "#":
                d = list(q)[:-1]
                q.clear()
            else:
                d = q.popleft()
            
            res.append(decrypt(d))
            
            
        if len(q) >=1 and q[-1] == "#":
            d = list(q)[:-1]
            res.append(decrypt(d))
        else:
            for d in q:
                res.append(decrypt(d))
        q.clear()
            
        return "".join(res)