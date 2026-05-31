# 1. Leer los datos (ajusta la ruta si es necesario)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# 2. Filtrar solo las fechas 1/2/2007 y 2/2/2007
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# 3. Combinar Fecha y Hora en una nueva columna llamada DateTime
# Esto es esencial para que el gráfico entienda que el tiempo es continuo
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), format="%d/%m/%Y %H:%M:%S")

# 4. Abrir el dispositivo gráfico PNG
png(filename = "plot2.png", width = 480, height = 480)

# 5. Crear el gráfico de línea
plot(data_subset$DateTime, data_subset$Global_active_power, 
     type = "l",              # "l" indica que queremos una línea
     xlab = "",               # Sin etiqueta en el eje X
     ylab = "Global Active Power (kilowatts)")

# 6. Cerrar el dispositivo
dev.off()
