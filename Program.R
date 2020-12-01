# -----------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------
library(lpSolveAPI)
# -----------------------------------------
# Player 1 - Game - David
# -----------------------------------------
DavidGameModel <- make.lp(0,7) # creating model with size 7 for Player David

lp.control(DavidGameModel, sense = "minimize") # Minimize as David is losing

set.objfn(DavidGameModel, c(0, 0, 0, 0, 0, 0, 1)) # assignning objective function

# Player 2 - Strategy 1
add.constraint(DavidGameModel, c(-1, 0, 0, 0, 0, -1, 1), ">=", 0)

# Player 2 - Strategy 2
add.constraint(DavidGameModel, c(-1, -1, 0, 0, -1, -1, 1), ">=", 0)

# Player 2 - Strategy 3
add.constraint(DavidGameModel, c(0, -1, -1, -1, -1, 0, 1), ">=", 0)

# Player 2 - Strategy 4
add.constraint(DavidGameModel, c(0, 0, -2, -2, 0, 0, 1), ">=", 0)

# Player 2 - Strategy 5
add.constraint(DavidGameModel, c(0, -1, -1, -1, -1, 0, 1), ">=", 0)

# Player 2 - Strategy 6
add.constraint(DavidGameModel, c(-1, -1, 0, 0, -1, -1, 1), ">=", 0)

# Player 2 - Strategy 7
add.constraint(DavidGameModel, c(-1, 0, 0, 0, 0, -1, 1), ">=", 0)

# Global Constraint to get sum of 1
add.constraint(DavidGameModel, c(1, 1, 1, 1, 1, 1, 0), "=", 1)

set.bounds(DavidGameModel, lower = c(0, 0, 0, 0, 0, 0, -Inf))

rowNames <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8") # Constraints names
colNames <- c("X1", "X2", "X3", "X4", "X5", "X6", "V") # Variables

dimnames(DavidGameModel) <- list(rowNames, colNames) # Assigning dimentions

solve(DavidGameModel) # solving the model

get.objective(DavidGameModel)

get.variables(DavidGameModel)

get.constraints(DavidGameModel) 

DavidGameModel

# -----------------------------------------------------------------------------------

# -----------------------------------------
# Player 2 - Game - Helen
# -----------------------------------------
HelenGameModel <- make.lp(0,8) # creating model with 8 variables

lp.control(HelenGameModel, sense = "maximize") # maximizing as Helen is winning

set.objfn(HelenGameModel, c(0, 0, 0, 0, 0, 0, 0, 1)) # setting objective function

# Player 1 - Strategy 1
add.constraint(HelenGameModel, c(-1, -1, 0, 0, 0, -1, -1, 1), "<=", 0)

# Player 1 - Strategy 2
add.constraint(HelenGameModel, c(0, -1, -1, 0, -1, -1, 0, 1), "<=", 0)

# Player 1 - Strategy 3
add.constraint(HelenGameModel, c(0, 0, -1, -2, -1, 0, 0, 1), "<=", 0)

# Player 1 - Strategy 4
add.constraint(HelenGameModel, c(0, 0, -1, -2, -1, 0, 0, 1), "<=", 0)

# Player 1 - Strategy 5
add.constraint(HelenGameModel, c(0, -1, -1, 0, -1, -1, 0, 1), "<=", 0)

# Player 1 - Strategy 6
add.constraint(HelenGameModel, c(-1, -1, 0, 0, 0, -1, -1, 1), "<=", 0)

# Global Constraint - to get sum of one
add.constraint(HelenGameModel, c(1, 1, 1, 1, 1, 1, 1, 0), "=", 1)

set.bounds(HelenGameModel, lower = c(0, 0, 0, 0, 0, 0, 0, -Inf))

rowNames <- c("C1", "C2", "C3", "C4", "C5", "C6", "C7") # Constraints names
colNames <- c("y1", "y2", "y3", "y4", "y5", "y6", "y7", "V") # Variables

dimnames(HelenGameModel) <- list(rowNames, colNames) # assigning values to model

solve(HelenGameModel) # solving the model

get.objective(HelenGameModel)

get.variables(HelenGameModel)

get.constraints(HelenGameModel) 

HelenGameModel
# -----------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------