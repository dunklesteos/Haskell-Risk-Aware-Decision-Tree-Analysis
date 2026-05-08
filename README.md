# Haskell-Risk-Aware-Decision-Tree-Analysis
Haskell coding exercise

PROJECT DESCRIPTION: RISK-AWARE DECISION TREE (HASKELL)

Data Structure:
The RiskTree is implemented using an Algebraic Data Type with three constructors: Leaf (terminal costs), DecisionNode (points of choice), and ChanceNode (probabilistic events).

Risk Cost Calculation (riskcost):

For DecisionNodes, the function recursively selects the minimum risk cost between branches.

For ChanceNodes, it calculates the Mean and Variance of the sub-trees. The final risk-adjusted cost is computed using the formula: Cost = Mean + (lambda * Variance), where lambda represents the risk-aversion level.

Tree Construction (risk_aware):
The tree is built recursively using a divide-and-conquer approach. The function splits the input lists of labels and costs into two halves at each step to ensure a balanced tree structure.

Tree Metrics:

risktreeheight: Recursively calculates the maximum depth of the tree (Leaf = 0).

nodetype: Traverses the tree to return a tuple (DecisionCount, ChanceCount), providing a structural summary of all non-leaf nodes.

Implementation Details:
The project utilizes functional programming core concepts such as pattern matching, recursion, and lazy evaluation. All functions have been verified for correctness within the GHCI environment.
