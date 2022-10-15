class Solution:
    def arraysIntersection(self, arr1: List[int], arr2: List[int], arr3: List[int]) -> List[int]:
        i, j, k = 0, 0, 0 # indices of three arrays
        n1, n2, n3 = len(arr1), len(arr2), len(arr3)
        
        ans = []
        while i < n1 and j < n2 and k < n3:
            _min = min(arr1[i], arr2[j], arr3[k])
            _max = max(arr1[i], arr2[j], arr3[k])
            
            if _min == _max: # all arrays with same value
                ans.append(arr1[i])
                
                i += 1
                j += 1
                k += 1
                continue
                
            while i < n1 and arr1[i] < _max:
                i += 1
            
            while j < n2 and arr2[j] < _max:
                j += 1
            
            while k < n3 and arr3[k] < _max:
                k += 1
        
        return ans
            