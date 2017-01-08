library(readr)
library(stringr)
library(dplyr)

transactions <- read_csv("invoice_items.csv")
transactions[transactions$product=="PepsiCo Expo" | transactions$product == "Microsoft x YouX Expo" | transactions$product == "P&G CBD Expo Marketin",6] <- "LP Company Event"

transactions <- mutate(transactions, startup = str_detect(transactions$product, "[eE]xpo|Startup Gold"))
transactions <- mutate(transactions, corporate = str_detect(transactions$product, "Career Fair|CF"))

tmp <- filter(transactions, !(startup | corporate))
tmpStartup <- filter(transactions, startup)
tmpCorporate <- filter(transactions,corporate)

