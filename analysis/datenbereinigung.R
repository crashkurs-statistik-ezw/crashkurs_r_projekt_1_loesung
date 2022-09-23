# 1.1 Setup -------------------------------------------------------------
# 1.1.1 Pakete laden
# (Installiere und) lade die Pakete tidyverse, janitor und haven
# Tipp: Pakete werden mit dem Befehl install.packages installiert:
#  z. B. install.packages("janitor")
library(tidyverse)
library(janitor)
library(haven)


# 1.1.2 Geladene Pakete ansehen
# Führe den folgenden Befehl aus und prüfe, ob die Pakete
# tidyverse, janitor und haven unter "other attached packages"
# zu finden sind. Alle Funktionen aus diesen Paketen können
# in deinem Skript verwendet werden.
sessionInfo()


# 2.2 Daten einlesen ------------------------------------------------------

# 2.2.1 Daten einlesen
# * Lese den Datensatz data/hr_data.csv ein
# * Speichere den Datensatz in der Variable "hr_data"
# * Tipp: read_csv wird verwendet, wenn die Werte in der CSV-Datei
#   durch ein Komma getrennt sind. read_csv2 benutzt du fuer
#   CSV-Dateien, die Werte mit einem Semikolon trennen (siehe ?read_csv)
hr_data <- read_csv("data/hr_data.csv")


# 2.3 Daten bereinigen ---------------------------------------------

# 2.3.1 Variablennamen bereinigen
# * Reinige die Variablennamen mit der Funktion clean_names 
#   aus dem Paket jantior (siehe ?clean_names)
# * Speichere den bereinigten Datensatz in der Variable "hr_cleaned"
hr_cleaned <- hr_data %>% 
  clean_names(case = "snake")


# 2.4 Datenexport ---------------------------------------------------------

# 2.4.1 CSV-Datei exportieren
# * Exportiere den Datensatz hr_cleaned in den Ordner data/cleaned
# * Speichere den Datensatz  unter data/cleaned/hr_cleaned.csv
write_csv(hr_cleaned, "data/cleaned/hr_cleaned.csv")


# 2.4.2 SAV-Datei exportieren
# * Um die Daten in SPSS zu nutzen, exportiere den gereinigten Datensatz mit der
#   Funktion write_sav aus dem Paket haven (siehe ?write_sav)
# * Speichere die Daten unter data/cleaned/hr_cleaned.sav
write_sav(hr_cleaned, "data/cleaned/hr_cleaned.sav")
