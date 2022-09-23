
# 2.5 Setup ---------------------------------------------------------------

# 2.5.1 Lade den Datensatz
# * Lade den Datensatz data/cleaned/hr_cleaned.csv mit der Funktion read_csv
# * Speichere den Datensatz in der Variable hr_cleaned
hr_cleaned <- read_csv("data/cleaned/hr_cleaned.csv")


# 2.6 Daten explorieren  ------------------------------------------------

# 2.6.1 Daten anzeigen
# Zeige dir den Datensatz mit der Funktion glimpse und view an
glimpse(hr_cleaned)
view(hr_cleaned)


# 2.6.2 Reihen und Spalten zählen
# Wie viele Reihen und Spalten hat der Datensatz? Nutze die Funktionen nrow, 
# ncol und dim
nrow(hr_cleaned)
ncol(hr_cleaned)
dim(hr_cleaned)


# 2.6.3 Geschlechterverteilung
# Wie viele Männer und Frauen sind im Datensatz?
hr_cleaned %>%
  count(gender)


# 2.6.4 Durchschnittliches Alter berechnen
# Bestimme den Mittelwert, Median und Modalwert des Alters der Mitarbeitenden
mean(hr_cleaned$age, na.rm = TRUE)
median(hr_cleaned$age, na.rm = TRUE)
hr_cleaned %>% 
  count(age, sort = TRUE)


# 2.6.5 Table lesen
# Wie viele Mitarbeitende sind 29 Jahre alt und wie viele sind 60 Jahre alt?
# 29 -> 68
# 60 -> 5


# 2.6.6 Altersverteilung bestimmen
# Bestimme die Spannweite, Varianz und Standardabweichung des Alters
range(hr_cleaned$age)
sd(hr_cleaned$age)
var(hr_cleaned$age)


# 2.6.7 Work-Life-Balance bestimmen
# * Untersuche, ob sich die Work-Life-Balance mit dem Alter verändert 
# * Berechne den Mittelwert für alle Ausprägungen der Variable work_life_balance
#   mit den Funktionen group_by und summarise
# * Sind Mitarbeitende mit einer schlechten Work-Life-Balance durchschnittlich
#   älter als Mitarbeitende mit einer schlechten Work-Life-Balance?
hr_cleaned %>%
  group_by(work_life_balance) %>%
  summarise(
    mean_age = mean(age)
  )


# 2.7 Daten visualisieren -----------------------------------------------------

# 2.7.1 Altersverteilung visualisieren
# * Erstelle ein Histogramm zur Altersverteilung der Mitarbeitenden
# * Nutze die Funktion ggplot und lege die Variable age auf die x-Achse
# * Nutze das geom 'geom_histogram' 
# * Wie könnte man die Darstellung des Histograms weiter verbessern?
ggplot(hr_cleaned, aes(x = age)) +
  geom_histogram(fill = "grey80", color = "grey20",
                 binwidth = 1) +
  scale_y_continuous(expand = expansion(c(0, 0.05))) +
  labs(
    x = "Alter",
    y = "Häufigkeit"
  )


# 2.7.2 Visualisierung speichern
# * Speichere die Visualisierung im R-Projekt ab unter dem Pfad
#   images/histogram_verteilung_alter.png
# * ggsave speichert immer die letzte Visualisierung ab, du musst also den Code
#   jeweils durchführen, bevor du die Visualisierung speicherst
ggsave("images/histogram_verteilung_alter.png",
       width = 8, height = 5, dpi = 300)


# 2.7.3 Streudiagramm zum Einkommen erstellen
# Untersuche, ob ältere Mitarbeiter mehr verdienen als jüngere Mitarbeiter
# * Erstelle ein Streudiagramm, das die Variable age auf der x-Achse und die
#   Variable monthly_income auf der y-Achse darstellt
# * Erstelle mit facet_wrap ein eigenes Streudiagramm für jede Abteilung
# * Füge mit Hilfe von labs einen sinnvollen Titel und Achsentitel hinzu
ggplot(hr_cleaned, aes(x = age, y = monthly_income)) +
  geom_point(alpha = .7) +
  facet_wrap(vars(department)) +
  labs(
    title = "Beziehung zwischen Monatseinkommen und Alter\nin den Abteilungen",
    x     = "Alter",
    y     = "Monatseinkommen"
    )


# 2.7.4
# Speichere die Visualisierung im R-Projekt ab unter dem Pfad
# images/streudiagramm_monatseinkommen_alter.png
ggsave("images/streudiagramm_monatseinkommen_alter.png", width = 8,
       height = 5, dpi = 300)
