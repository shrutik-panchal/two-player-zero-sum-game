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