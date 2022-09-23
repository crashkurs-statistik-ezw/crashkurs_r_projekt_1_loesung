# 1.1 Setup -------------------------------------------------------------
# 1.1.1 Pakete laden
# (Installiere und) lade die Pakete janitor und haven
library(janitor)
library(haven)

# 2.2 Daten einlesen ------------------------------------------------------

# 2.2.1 Daten einlesen
# * Lese den Datensatz data/hr_data.csv ein
# * Speichere den Datensatz in der Variable hr_data
hr_data <- read_csv("data/hr_data.csv")


# 2.3 Daten bereinigen ---------------------------------------------

# 2.3.1 Variablennamen bereinigen
# * Wandle die Variablennamen mit clean_names in snake case um
# * Speichere den bereinigten Datensatz in der Variable hr_cleaned
hr_cleaned <- hr_data %>% 
  clean_names(case = "snake")


# 2.4 Datenexport ---------------------------------------------------------

# 2.4.1 CSV-Datei exportieren
# * Exportiere den Datensatz in den Ordner data/cleaned
# * Speichere die Daten unter data/cleaned/hr_cleaned.csv
write_csv(hr_cleaned, "data/cleaned/hr_cleaned.csv")


# 2.4.2 SAV-Datei exportieren
# * Um die Daten in SPSS zu nutzen, exportiere den gereinigten Datensatz mit der
#   Funktion write_sav
# * Speichere die Daten unter data/cleaned/hr_cleaned.sav
write_sav(hr_cleaned, "data/cleaned/hr_cleaned.sav")
