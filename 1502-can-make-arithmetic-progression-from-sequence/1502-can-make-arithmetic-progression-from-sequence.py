class Solution:
    def canMakeArithmeticProgression(self, arr: List[int]) -> bool:
        arr = sorted(arr)
        step = None
        last = None
        # [3, 5, 1]
        # [1, 3, 5]
        # num:  -  1  3  5
        # last: N  1  3  5
        # step: N  -  2  2
        # ans:         
        for num in arr:
            if last is not None:
                if step is None:
                    step = num - last
                elif num - last != step:
                    return False
            last = num
        return True