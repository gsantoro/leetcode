# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumOfLeftLeaves(self, root: Optional[TreeNode]) -> int:
        def _sum(r: Optional[TreeNode], left: bool) -> int:
            if not r:
                return 0
            
            if not r.left and not r.right:
                if left:
                    return r.val
                else:
                    return 0
            
            return _sum(r.left, True) + _sum(r.right, False)
        
        
        return _sum(root, False)