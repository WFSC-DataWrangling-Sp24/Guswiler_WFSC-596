
create_capture_hist = function(tag, data) {
  
  prd <- seq(min(data$period), max(data$period))
  
  capture_history = "" # create empty string
    
  for (p in 1:length(prd)) {
      
    tmp <- which(data$tag == tag & data$period == prd[p])
      
    if (nrow(data[tmp, ]) == 0) {
      state = "0"
      capture_history = paste(capture_history, state, sep = "")
    } else {
      state = "1"
      capture_history = paste(capture_history, state, sep = "")
    }
  }
  
  capt_history <- data.frame(capture_history, tag)
    
  return(capt_history)
}
