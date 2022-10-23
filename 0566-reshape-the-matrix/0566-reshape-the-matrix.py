class Solution:
    def matrixReshape(self, mat: List[List[int]], r: int, c: int) -> List[List[int]]:
        m, n = len(mat), len(mat[0])
        if r * c != m * n:  # note: illegal
            return mat
        if m == r and n == c: # note: same shape
            return mat
        
        # m = 3, n = 2
        # [0, 1]
        # [2, 3]
        # [4, 5]
        
        # r = 2, c = 3
        # [0, 1, 2]
        # [3, 4, 5]
        
        ans = [[0] * c for _ in range(r)]
        for i in range(m):
            for j in range(n):
                i_1, j_1 = divmod(i * n + j, c)
                ans[i_1][j_1] = mat[i][j]
        return ans
                
            