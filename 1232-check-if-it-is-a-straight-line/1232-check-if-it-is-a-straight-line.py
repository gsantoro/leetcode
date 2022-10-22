class Solution:
    def checkStraightLine(self, coordinates: List[List[int]]) -> bool:
        n = len(coordinates)
        x_0, y_0 = coordinates[0]
        x_1, y_1 = coordinates[1]
        
        # y - y_0 = m (x - x_0)
        if x_1 == x_0: # note: by condition, you cannot have the same point. y_1 != y_0
            m = math.inf
        else:
            m = (y_1 - y_0) / (x_1 - x_0)
        
        for i in range(2, n):
            x_i, y_i = coordinates[i]
            if m != math.inf:
                y = m * (x_i - x_0) + y_0
                if y != y_i:
                    return False
            else:
                if x_i != x_0:
                    return False
        return True