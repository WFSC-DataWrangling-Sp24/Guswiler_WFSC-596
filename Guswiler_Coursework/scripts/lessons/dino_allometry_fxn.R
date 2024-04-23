mass_from_length <- function(length, dino_group) {
  if (dino_group == 'Stegosauria') {
    mass <- 10.95 * length ^ 2.64
  } else if (dino_group == 'Theropoda') {
    mass <- 0.73 * length ^ 3.63
  } else if (dino_group == 'Sauropoda') {
    mass <- 214.44 * length ^ 1.46
  } else {
    mass <- 25.37 * length ^ 2.49
  }
  return(mass)
}