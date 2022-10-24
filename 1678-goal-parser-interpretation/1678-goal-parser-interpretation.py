class Solution:
    def interpret(self, command: str) -> str:
        ans = []
        
        last_char = "-"
        last_pos = -1
        
        #              0123456
        # command.  = "G()(al)"
        # ans       =  G o
        # last_char =  -( (
        # last_pos  =  -1 3
        for i, c in enumerate(command):
            if c == "G":
                ans.append("G")
            elif c == "(":
                last_pos = i
            elif c == ")":
                s = command[last_pos + 1:i]
                if len(s) == 0:
                    ans.append("o")
                else:
                    ans.append(s)
            last_char = c
        return "".join(ans)
                    

                