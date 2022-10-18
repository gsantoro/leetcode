class Solution:
    def average(self, salary: List[int]) -> float:
        mn, mx, s, l = min(salary), max(salary), sum(salary), len(salary)
        return (s - mn - mx) / (l - 2)
        