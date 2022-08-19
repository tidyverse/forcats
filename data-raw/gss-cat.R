# Extracted from GSS data explorer
# Variables: year, id, marital, race, rincome, partyid, relig, denom
# Years: 2000-2014
# Export: xls and stata
library(tibble)
library(dplyr)

# Warning because last two rows contains source info
gss <- readxl::read_excel("data-raw/GSS.xls")

vars <- readxl::read_excel("data-raw/GSS.xls", sheet = 2)
names(gss) <- vars$Name

na <- c("Not applicable", "No answer", "Don't know")

gss_cat <- gss %>%
  filter(!is.na(id_)) %>%
  select(-id_) %>%
  mutate(
    year = as.integer(year),
    age = as.integer(readr::parse_number(age, na = na)), # ignore 148 "or older"
    tvhours = as.integer(readr::parse_double(tvhours, na = na))
  )

# From .do file, copy factor definitions (to get levels)
levels <- list(
  marital = c(
    "No answer",
    "Never married",
    "Separated",
    "Divorced",
    "Widowed",
    "Married"
  ),
  race = c(
    "Other",
    "Black",
    "White",
    "Not applicable"
  ),
  rincome = c(
    "No answer",
    "Don't know",
    "Refused",
    "$25000 or more",
    "$20000 - 24999",
    "$15000 - 19999",
    "$10000 - 14999",
    "$8000 to 9999",
    "$7000 to 7999",
    "$6000 to 6999",
    "$5000 to 5999",
    "$4000 to 4999",
    "$3000 to 3999",
    "$1000 to 2999",
    "Lt $1000",
    "Not applicable"
  ),
  partyid = c(
    "No answer",
    "Don't know",
    "Other party",
    "Strong republican",
    "Not str republican",
    "Ind,near rep",
    "Independent",
    "Ind,near dem",
    "Not str democrat",
    "Strong democrat"
  ),
  relig = c(
    "No answer",
    "Don't know",
    "Inter-nondenominational",
    "Native american",
    "Christian",
    "Orthodox-christian",
    "Moslem/islam",
    "Other eastern",
    "Hinduism",
    "Buddhism",
    "Other",
    "None",
    "Jewish",
    "Catholic",
    "Protestant",
    "Not applicable"
  ),
  denom = c(
    "No answer",
    "Don't know",
    "No denomination",
    "Other",
    "Episcopal",
    "Presbyterian-dk wh",
    "Presbyterian, merged",
    "Other presbyterian",
    "United pres ch in us",
    "Presbyterian c in us",
    "Lutheran-dk which",
    "Evangelical luth",
    "Other lutheran",
    "Wi evan luth synod",
    "Lutheran-mo synod",
    "Luth ch in america",
    "Am lutheran",
    "Methodist-dk which",
    "Other methodist",
    "United methodist",
    "Afr meth ep zion",
    "Afr meth episcopal",
    "Baptist-dk which",
    "Other baptists",
    "Southern baptist",
    "Nat bapt conv usa",
    "Nat bapt conv of am",
    "Am bapt ch in usa",
    "Am baptist asso",
    "Not applicable"
  )
)

for (name in names(levels)) {
  gss_cat[[name]] <- factor(gss_cat[[name]], level = levels[[name]])
}

use_data(gss_cat, overwrite = TRUE)
