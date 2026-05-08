--We start with tree structure
data RiskTree=Leaf Double | DecisionNode RiskTree RiskTree
                          | ChanceNode Double RiskTree RiskTree --We have 3 options (leaf, DecisionNode, ChanceNode)
                          deriving (Show, Eq, Ord)--I saw Ord from lab section and added :) 
                          
--We continue with formulas (3 option)
--Calculate function(riskcost): (we use lambda, p, l, r to find mean, variance and riskcost (I gave the variable names))
--1st case
riskcost (Leaf x) lambda =x --leaf=0

--2nd case
riskcost(DecisionNode left right) lambda =(min l r) --continue to minimum risk
  where 
    l=riskcost left lambda
    r=riskcost right lambda


riskcost (ChanceNode p left right) lambda = mean + (lambda*variance)
  where 
    l=riskcost left lambda
    r=riskcost right lambda
    mean =p*l +(1-p)*r
    variance = p*(l-mean)**2+(1-p)*(r-mean)**2-- calculate risk cost 

--logic is finished now wee need tree creator
risk_aware [] (x:_) = Leaf x --if list is empty x=leaf

risk_aware ((label,n):ns) ls = if label=="Decision" -- We are controlling the labels (they are from assignment sheet)
                       then DecisionNode left right --is label "Decision" or "Change" ?
                       else ChanceNode n left right
  where
    nMid= length ns `div` 2 --ns/2 is not working (we divide the list and continue adding nodes recursively)
    lMid= length ls `div` 2
    
    left=risk_aware(take nMid ns) (take lMid ls)
    right=risk_aware(drop nMid ns) (drop lMid ls)
	
--Tree Height
risktreeheight(Leaf _) =0 --if we are on the lead height =0
risktreeheight (DecisionNode left right)=1+max (risktreeheight left) (risktreeheight right)
risktreeheight (ChanceNode _ left right)= 1+max (risktreeheight left) (risktreeheight right)
--if we are on the decision or change nodes we add recursively 1 and continue until we reach a leaf node

--Node type counter 
nodetype (Leaf _) = (0, 0)--leaf = 0
nodetype (DecisionNode left right)= (1+ d1+d2,c1 + c2)--Counting the number of Decision Nodes
  where
    (d1, c1)= nodetype left
    (d2,c2)= nodetype right
nodetype (ChanceNode _ left right)=(d1 +d2,1+ c1+c2)--Counting the number of Change Nodes
  where
    (d1,c1)= nodetype left
    (d2,c2)= nodetype right
--This time we are recursively first check the node type then add 1 to result


--Finally I loaded checked "nodetype","risktreeheight" and"riskcost" functions from GHCI and they are working fine