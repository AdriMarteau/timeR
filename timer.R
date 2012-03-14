if (!require("tcltk2"))        install.packages("tcltk2")
RUNNING <- F

timer.freq <- 1000 #in ms


timer.pause <- function() {RUNNING <<- F}
timer.start <- function() {RUNNING <<- T}

timer.init <- function()
{
  tclTaskSchedule(timer.freq, timer.tick_meta(), id = "TIMER", redo=T)
  RUNNING <<- F
}

timer.stop <- function() {tclTaskDelete("TIMER"); RUNNING <<- F}

timer.tick_meta <- function()
{
  if(!RUNNING) return()
  timer.tick()
}

timer.tick <- function() {}