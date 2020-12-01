# Two Player Zero Sum Game in [R](/Program.R)

### Introduction
Helen and David are playing a game by putting chips in two piles (each player has two piles P1 and P2), respectively. Helen has 6 chips and David has 5 chips. Each player places his/her chips in his/her two piles, then compare the number of chips in his/her two piles with that of the other player’s two piles. Note that once a chip is placed in one pile it cannot be moved to another pile. There are four comparisons including Helen’s P1 vs David’s P1, Helen’s P1 vs David’s P2, Helen’s P2 vs David’s P1, and Helen’s P2 vs David’s P2. For each comparison, the player with more chips in the pile will score 1 point (the opponent will lose 1 point). If the number of chips is the same in the two piles, then nobody will score any points from this comparison. The final score of the game is the sum score over the four comparisons. For example, if Helen puts 5 and 1 chips in her P1 and P2, David puts 4 and 1 chips in his P1 and P2, respectively. Then Helen will get 1 (5 vs 4) + 1 (5 vs 1) - 1 (1 vs 4) + 0 (1 vs 1) = 1 as her final score, and David will get his final score of -1.

This short study answers the following points:
- Why/how this game can be considered as two-player-zero-sum game?
- Formulation of payoff matrix for the game.
- What is saddle point and does this game has a saddle point?
- Contruction of a linear programming model.
- Production of appropriate R program to solve the linear programming model.
- Solving the game for David using produced linear programming model.

### Solution

#### The reason behind considering this game as zero-sum game because:
- Zero-sum means among the two players whoever wins the game, the opposite player will lose the same amount
- Both the players can have different strategies whereas they play for once


#### Payoff Matrix:

Notation (i, j) has been used to record number of chips into pile for each player where i belongs to pile P1 and j belongs to pile P2 for each player that means (1, 4) denotes that 1 chip in P1 and 4 chips in P2.

![Graph-1](/Images/img1.png)


#### Saddle Point:

The saddle point is a pair of strategies where none of the player can perform better hence we have achieved saddle point (optimal solution) where a 2-person zero-sum game is in equilibrium stage.

A game has achieved equilibrium can be said if and only if:
- David has no different opportunities available to choose from while Helen uses the strategy (same way for reverse scenario).
- None of the player finds optional strategy to choose, then game has achieved optimal solution.

This optimal solution is called saddle point. In this case U (lower value of the game) = L (upper value of the game) is true.
In this game, U ≠ L hence we must follow mixed strategies as optimal payoff cannot be achieved by a pure strategy. In the game, overall solution for David is loss contrast to Helen hence David will look forward to minimizing the loss while on the other end Helen will try to maximize the loss of David.

#### Linear Model for the game:
1. Linear Model for David:
    -   Min z = v (u.r.s. means unrestricted)
    - v – (– x1 – x6) >= 0
    - v – (– x1 – x2 – x5 – x6) >= 0
    - v – (– x2 – x3 – x4 – x5) >= 0
    - v – (– 2x3 – 2x4) >= 0
    - v – (– x2 – x3 – x4 – x5) >= 0
    - v – (– x1 – x2 – x5 – x6) >= 0
    - v – (– x1 – x6) >= 0
    - x1 + x2 + x3 + x4 + x5 + x6 = 1
    - xi >= 0 if i = 1 to 6

2. Linear Model for Helen:
    - Max z = v (u.r.s. means unrestricted)
    - v – (– y1 – y2 – y6 – y7) <= 0
    - v – (– y2 – y3 – y5 – y6) <= 0
    - v – (– y3 – 2y4 – y5) <= 0
    - v – (– y3 – 2y4 – y5) <= 0
    - v – (– y2 – y3 – y5 – y6) <= 0
    - v – (– y1 – y2 – y6 – y7) <= 0
    - y1 + y2 + y3 + y4 + y5 + y6 + y7 = 1
    - yi >= 0 if i = 1 to 7

#### Devlopment of Linear Model in R -> [R Code](/Program.R)

#### Solving David's Game using Linear Model:

Using David’s linear game model, the following mixed strategies were achieved: X1 = 0.67, X2 = 0.00, X3 = 0.33, X4 = 0.00, X5 = 0.00, X6 = 0.00

Using these obtained values with the constraints specified in point D.1:
- Reward = 0.67 if Helen’s strategy = y1
- Reward = 0.67 if Helen’s strategy = y2
- Reward = 0.33 if Helen’s strategy = y3
- Reward = 0.66 if Helen’s strategy = y4
- Reward = 0.33 if Helen’s strategy = y5
- Reward = 0.67 if Helen’s strategy = y6
- Reward = 0.67 if Helen’s strategy = y7

David is on losing side hence David should choose mixed strategies (X1 = 0.67, X2 = 0.00, X3 = 0.33, X4 = 0.00, X5 = 0.00, X6 = 0.00) to make Helen’s reward as small as possible as she will try to obtain expected reward of 0.67 in each turn.