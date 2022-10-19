class Solution:
    def dist(self, x: int, y:int, p: List[int]) -> int:
        return abs(x - p[0]) + abs(y - p[1])
    
    def nearestValidPoint(self, x: int, y: int, points: List[List[int]]) -> int:
        ans = -1 # no valid points
        dist = 0
        last_point = None
        for i, point in enumerate(points):
            # not valid point
            if not(point[0] == x or point[1] == y):
                continue
            d = self.dist(x, y, point)
            if last_point is None or d < dist:
                last_point = point
                dist = d
                ans = i
        return ans