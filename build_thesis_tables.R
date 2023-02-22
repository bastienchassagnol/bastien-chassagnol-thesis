## ----setup, include=FALSE------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
	echo = FALSE,
	warning = FALSE, 
	message = FALSE,
	out.width = "100%",
	fig.fullwidth=TRUE,
	fig.pos = "h")

library(ggplot2)
library(dplyr)
library(flextable)
library(kableExtra)
library(downlit)
library(RGMMBench)

options(dplyr.summarise.inform = FALSE) # remove the override .groups argument


