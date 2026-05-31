# 1. Leer los datos (si ya tienes cargado 'data', puedes saltarte esta línea)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# 2. Filtrar fechas
data_subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# 3. Combinar Fecha y Hora
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), format="%d/%m/%Y %H:%M:%S")

# 4. Abrir dispositivo PNG
png(filename = "plot3.png", width = 480, height = 480)

# 5. Crear el gráfico inicial (Sub_metering_1)
plot(data_subset$DateTime, data_subset$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

# 6. Añadir la segunda línea (Sub_metering_2 en rojo)
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red")

# 7. Añadir la tercera línea (Sub_metering_3 en azul)
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue")

# 8. Añadir la leyenda para identificar las líneas
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)

# 9. Cerrar dispositivo
dev.off()
