

shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    dp = input$dataset$datapath
    if(!is.null(dp) ) {
      res = read.csv(dp, header = TRUE, stringsAsFactors = FALSE)  
    } else {
      res = as.data.frame(matrix("No table loaded."))
    }
    return(res)
  })
  
  rulesetInput <- reactive({
    dp = input$ruleset$datapath
    print(dp)
    if(!is.null(dp)) {
      res = readLines(dp)
    } else {
      res = "NA"
    }
    return(res)
  })

  profileInput <- reactive({
    x = as.rules(rulesetInput())
    z = datadict.profile(datasetInput(), x)
    z
  })
  
  output$recLabels = renderUI({
    cn = names(datasetInput())
    if(length(cn)>1){
     un = rep(FALSE, length(cn))
    for(i in 1:length(cn)){
      un[i] = all(!duplicated(datasetInput()[,cn[i]]), !is.double(datasetInput()[,cn[i]]))
    }
    cn = cn[un]
     if(length(cn)>1) selectInput("labels", "Choose a variable for labeling records in heatmap:", cn)
    }
  })
  
  output$recScores = renderUI({
    scores = profileInput()$scores[1:(nrow(profileInput()$scores)-2),ncol(profileInput()$scores)]
    scores = sort(unique(scores))
    if(length(scores)>1){
    smin = min(scores)
    smax = max(scores)
    sval = max(smin, (smax-1))
    sliderInput("sscores","Restrict to low quality records till score of", min=smin, 
                max = smax, value = sval)
    }
  })
  
  
  output$scoreSums = renderPlot({
    if(is.datadict.profile(profileInput())){
      profile = profileInput()
      scoreSum(profile)
    }
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    
    sc = input$sscores
    dt = datasetInput()
    pi = profileInput()
    rs = dt
    if(!is.null(sc)){
      ds = pi$scores[1:nrow(dt),]
      ix = ds$Record.score <= sc
      rs = dt[ix,]
    }
    #head(rs, n = 300)
  })

  output$scores <- renderTable({
    sc = input$sscores
    dt = datasetInput()
    pi = profileInput()
    rs = as.data.frame("None", ncol=1, nrow=1)
    if(!is.null(sc)){
      ds = pi$scores[1:nrow(dt),]
      ix = ds$Record.score <= sc
      ds = ds[ix, ]
    }
    #head(ds, n = 300)
  }, digits = 0)
  
  
  output$heatmap <- renderPlot({
    if(is.datadict.profile(profileInput())){
      
      
      rm = 300
      title = paste("Heatmap of dataquality of up to first ",rm," records", sep="")
      
      heatmap.quality(profileInput(), input$labels, recMax = rm, scoreMax = input$sscores,
                      main = title
      )  
    }
    
  }, width = 700, height=1000)
  
  output$coverage <- renderPlot({
    if(is.datadict.profile(profileInput())){
      ruleCoverage(profileInput())
    }
  })
  
  
  output$profile <- renderTable({
   as.data.frame(prep4rep(profileInput()$checks))  
  })
  
  output$descriptive <- renderTable({
    dt = datasetInput()
    if(names(dt)[1] != "V1"){
      shortSummary(dt)
    }
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { "scores.csv" },
    content = function(file) {
      write.csv(profileInput()$scores, file)
    }
  )
  
  
  
})