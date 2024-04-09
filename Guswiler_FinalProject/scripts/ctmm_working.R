library(ctmm)

fishlake <- as.telemetry("Guswiler_FinalProject/data_raw/USU_ Coyote and Puma (Fishlake NF, UT).csv")

plot(fishlake)

COL <- color(fishlake, by = "individual")
plot(fishlake, col=COL)

plot(fishlake[[1]], col=COL)

for (i in 1:length(fishlake)) {
  plot <- plot(fishlake[[i]])
  print(plot)
}
