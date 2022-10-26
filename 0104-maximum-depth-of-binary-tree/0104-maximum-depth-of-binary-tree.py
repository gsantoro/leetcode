# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        def _max(r: Optional[TreeNode]) -> int:
            if not r:
                return 0
            return 1 + max(_max(r.left), _max(r.right))
        
        return _max(root)