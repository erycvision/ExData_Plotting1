# 1. Leer los datos
# Usamos na.strings = "?" para que los valores faltantes sean tratados como NA
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# 2. Filtrar solo las fechas que pide la tarea (1 y 2 de febrero de 2007)
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# 3. Abrir el dispositivo gráfico PNG (480x480 píxeles)
png(filename = "plot1.png", width = 480, height = 480)

# 4. Crear el histograma
hist(data_subset$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# 5. Cerrar el dispositivo (esto guarda el archivo en tu carpeta)
dev.off()

# Filtrar solo las fechas 1/2/2007 y 2/2/2007
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Abrir el dispositivo gráfico PNG
png(filename = "plot1.png", width = 480, height = 480)

# Crear el histograma
hist(data_subset$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Cerrar el dispositivo
dev.off()
