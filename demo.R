## Demo - Steps

## 1. load library

# library(tidyndr)

## 2. import csv file (it was created yesterday so we will use the time stamp
## of yesterday)
# file_path <- here::here("ndr_example.csv")

# ndr <- read_ndr(file_path,
#                 time_stamp = "2021-04-23")

## 3. how many clients are active on treatment?
# tx_curr(ndr) %>%
#   nrow()

## How many different states are included in our data?

# ndr %>%
#   dplyr::distinct(state)

## Lagos as an example
## 4. how many clients should Benue be expecting for clinic appointment in May
# tx_appointment(ndr,
#                from = "2021-05-01",
#                to = "2021-05-31",
#                states = "Benue") %>%
#   nrow()

## 5. What is the tx_curr() of Lagos
# lag_curr <- tx_curr(ndr,
#                     states = "Lagos")
# nrow(lag_curr)

## 6. How many people will be eligible for viral load in Lagos by the end of June 2021?
# lag_eligible <- tx_vl_eligible(ndr,
#                                states = "Lagos",
#                                ref = "2021-06-30")
# nrow(lag_eligible)

## 7. How many people already have a viral load result and will not need a repeat by June
# lag_result <- tx_pvls_den(ndr,
#                           states = "Lagos",
#                           ref = "2021-06-30")
# nrow(lag_result)

## 8. How many people without a documented viral load result will need to have
## one before the end of June in Lagos?
# tx_vl_eligible(ndr,
#                states = "Lagos",
#                ref = "2021-06-30",
#                sample = TRUE)
# # or
# nrow(lag_eligible) - nrow(lag_result)

## 9. How many people with viral load results are suppressed in Lagos?
# lag_suppressed <- tx_pvls_num(ndr,
#                               states = "Lagos",
#                               ref = "2021-06-30")

## 10. What is the viral load cascade summary in Lagos
# lag_vl_cascade <- summarise_ndr(lag_curr,
#                                 lag_eligible,
#                                 lag_result,
#                                 lag_suppressed,
#                                 level = "state",
#                                 names = c("tx_curr",
#                                           "vl_eligible",
#                                           "vl_result",
#                                           "vl_suppressed"))

## 11. What percent of Q3 eligible clients in Lagos have a viral load result?

# lag_vl_cascade %>%
#   mutate(vl_coverage = vl_result / vl_eligible)

## 12. What is the gender disaggregation of the active clients across the Lagos facilities?
# disaggregate(lag_curr, by = "sex", level = "facility")
