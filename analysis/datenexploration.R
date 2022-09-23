# 2.5 Daten explorieren  ------------------------------------------------

# 2.5.1 Daten anzeigen
# Lasse dir den Datensatz einmal mit der Funktion glimpse und einmal mit der
# Funktion view anzeigen
glimpse(hr_data)
view(hr_data)

# 2.5.2 Reihen und Spalten zählen
# Wie viele Reihen und Spalten hat der Datensatz? Nutze die Funktionen nrow und
# ncol
nrow(hr_cleaned)
ncol(hr_cleaned)

# 2.5.3 Geschlechterverteilung
# Wie viele Männer und Frauen sind im Datensatz?
hr_cleaned %>%
  count(gender)

# 2.5.4 Durchschnittliches Alter berechnen
# Bestimme Mittelwert, Median und Modalwert des Alters der Mitarbeitenden
mean(hr_cleaned$age, na.rm = TRUE)
median(hr_cleaned$age)
table(hr_cleaned$age)

# 2.5.5 Table lesen
# Wie viele Mitarbeitende sind 29 Jahre alt und wie viele sind 60 Jahre alt?

# 2.5.6 Altersverteilung bestimmen
# Bestimme Spannweite, Varianz und Standardabweichung des Alters
range(hr_cleaned$age)
sd(hr_cleaned$age)
var(hr_cleaned$age)

# 2.5.7 Work-Life-Balance bestimmen
# * Untersuche, ob sich die Work-Life-Balance mit dem Alter verändert 
# * Berechne den Mittelwert für alle Ausprägungen der Variable work_life_balance
#   mit den Funktionen group_by summarise
# * Sind Mitarbeitende mit einer schlechten Work-Life-Balance durchschnittlich
#   älter als Mitarbeitende mit einer schlechten Work-Life-Balance?
hr_cleaned %>%
  group_by(work_life_balance) %>%
  summarise(
    mean_age = mean(age)
  )


# 2.6 Daten visualisieren -----------------------------------------------------

# 2.6.1 Altersverteilung visualisieren
# * Erstelle ein Histogramm sowie einen Boxplot zur Altersverteilung der
#   Mitarbeitenden
# * Nutze die Funktion ggplot und bestimme mit Hilfe von aesthetics, dass die
#   Variable age auf der x-Achse ist
# * Nutze die geoms 'geom_histogram' und 'geom_boxplot'
# * Welche Vorteile haben die beiden Visualisierungen jeweils? Kann man aus
#   einer der beiden mehr lesen als aus der anderen?
ggplot(hr_cleaned, aes(x = age)) +
  geom_histogram()

ggplot(hr_cleaned, aes(x = age)) +
  geom_boxplot()

# 2.6.2 Visualisierungen speichern
# * Speichere die Visualisierungen im R-Projekt ab unter dem Pfad
#   images/histogram_verteilung_alter.png und images/boxplot_verteilung_alter
# * ggsave speichert immer die letzte Visualisierung ab, du musst also den Code
#   jeweils durchführen, bevor du die Visualisierung speicherst
ggsave("images/histogram_verteilung_alter.png",
       width = 8, height = 5, dpi = 300)
ggsave("images/boxplot_verteilung_alter.png",
       width = 8, height = 5, dpi = 300)

# 2.6.3 Punktdiagramm zum Einkommen erstellen
# Untersuche, ob ältere Mitarbeiter mehr verdienen als jüngere Mitarbeiter
# * Erstelle ein Punktdiagramm, das die Variable age auf der x-Achse und die
#   Variable monthly_income auf der y-Achse darstellt
# * Gib den einzelnen Punkten mit Hilfe der aesthetics-Funktion eine Farbe
#   abhängig der nominalskalierten Variable department, um zu zeigen, wie die
#   Einkommensverteilung in den einzelnen Abteilungen aussieht
# * Füge mit Hilfe von labs einen sinnvollen Titel und Achsentitel hinzu
ggplot(hr_cleaned, aes(x = age, y = monthly_income)) +
  geom_point(aes(color = department)) +
  labs(
    title = "Punktdiagramm des Monatseinkommens und Alters",
    x     = "Alter",
    y     = "Monatseinkommen"
    )

# 2.6.4
# Speichere die Visualisierung im R-Projekt ab unter dem Pfad
# images/punktdiagramm_monatseinkommen_alter.png
ggsave("images/punktdiagramm_monatseinkommen_alter.png", width = 8,
       height = 5, dpi = 300)
