#Working directory
setwd("~/Documents/automated-grading-r-assignments")

#Get students' solution 
student_solutions <- list.files("../student_solns", pattern = "*.R")



#Compare library
library("compare", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.0")

## File
source("~/Documents/Thesis/R/assignment.R")
source("~/Documents/Thesis/R/solutions.R")

result <- c()
feedback <- c()
number_of_tasks <- ncol(answer)
total_grade <- 0;
## Compare answers
for(i in 1:number_of_tasks) {
  ## check every answer
  
  result[i] <- compare(solutions[i], answer[i], ignoreAttrs = TRUE)
  if (result[i] == TRUE){
    feedback[i] <- 'Correct!'
    total_grade <- total_grade + 1
  }else{
    sol <- toString(solutions[i])
    feedback[i] <- paste(c('The right solution is ', sol ), collapse = '')
  }
}


## Give feedback
#file.create('feedback.R', showWarnings = TRUE)

## evaluate

