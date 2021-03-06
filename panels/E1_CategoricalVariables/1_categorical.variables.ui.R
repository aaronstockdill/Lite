get.categorical.variables =  function(categorical_variables_select=NULL,data.set){
  if(is.null(data.set)){
    list(list(help.display('Categorical variables','categorical_variables',
                           "panels/E1_CategoricalVariables/3_categorical.variables.help.md"),
              br(),HTML("")),
         h1("Please select or import a data set."))
  }else{
    choices=c("Reorder levels",
              "Collapse levels",
              "Rename levels",
              "Combine categorical")
    list(list(selectInput(inputId="categorical_variables_select",
                          label="Categorical variables",
                          choices=choices,
                          selectize=F,
                          selected=which(choices%in%categorical_variables_select)),
              uiOutput("categorical.side.panel")
              ),
         uiOutput("categorical.main.panel")
         )
  }
}

categorical.variables.panel = function(categorical_variables_select,data.set){
  sidebarLayout(
    sidebarPanel(get.categorical.variables(categorical_variables_select,data.set)[[1]]),
    mainPanel(get.categorical.variables(categorical_variables_select,data.set)[[2]])
  )
}

collapse.sidebar.panel =  function(data.set){
  choices1 = c()
  choices2 = c()
  if(!is.null(data.set)&&!is.null(ncol(data.set))&&ncol(data.set)>0){
    choices1 = get.categorical.column.names(data.set)
  }else{
    choices1 = c()
  }
  list(helpText("Select a column from the first dropdown menu. The second 
                  dropdown menu will be filled when a column is selected. 
                  Select from the second dropdown menu all factors which 
                  should be collapsed into one. Numeric values are ignored, 
                  therefore columns of type numeric can not be selected. 
                  Please convert those to factors first."),
       selectInput("select.collapse.column","Select Column",choices=c("",choices1),multiple=F,selectize=F,selected=1),br(),
       selectInput("select.collapse.item", "Select levels to collapse",choices=choices2,multiple=T,selectize=T),br(),
       actionButton("collapse","Collapse levels"),br(),br(),
       help.display('Collapse Levels','collapse_levels',"panels/E1_CategoricalVariables/5_collapse.levels.help.md"),br(),HTML(""))
}

collapse.main.panel = function(){
  list(div(verbatimTextOutput("text_collapse_1st")),br(),
       helpText("New levels after input is submitted"),
       div(verbatimTextOutput("text_collapse_2nd")))
}

reorder.sidebar.panel =  function(data.set){
  choices1 = c()
  choices2 = c()
  if(!is.null(data.set)&&!is.null(ncol(data.set))&&ncol(data.set)>0){
    choices1 = get.categorical.column.names(data.set)
  }else{
    choices1 = c()
  }
  list(helpText("Select a column from the first dropdown menu. The second dropdown menu will be filled when a column is 
                selected. Select from the second dropdown menu in the desired order. Numeric values are ignored, 
                therefore columns of type numeric can not be selected. Please convert those to factors first. See 
                \"HELP\" below for more information."),
       selectInput("select.reorder.column","Select Column",choices=c("",choices1),multiple=F,selectize=F,selected=1),br(),
       selectInput("select.reorder.item", "Select in new Order",choices=choices2,multiple=T,selectize=T),br(),
       actionButton("reorder","Reorder"),br(),br(),
       help.display('Reorder Levels','reorder_levels',"panels/E1_CategoricalVariables/4_reorder.levels.help.md"),br(),HTML(""))
}

reorder.main.panel = function(){
  verbatimTextOutput(outputId="text_reorder")
}

combine.sidebar.panel =  function(data.set){
  choices1 = c()
  if(!is.null(data.set)&&!is.null(ncol(data.set))&&ncol(data.set)>0){
    choices1 = get.categorical.column.names(data.set)
  }else{
    choices1 = c()
  }
  list(helpText("Select factor columns to combine. All combined 
                columns will be added as additional column to 
                the data."),
       selectInput("select.combine.columns", "Select columns to combine",choices=choices1,multiple=T,selectize=T),br(),
       actionButton("combine","Combine levels"),br(),br(),
       help.display('Combine Levels','combine_levels',"panels/E1_CategoricalVariables/7_combine.levels.help.md"),br(),HTML(""))
}

combine.main.panel = function(){
  list(helpText("New levels after input is submitted"),br(),
       div(verbatimTextOutput("text_combine")))
}

rename.levels.sidebar.panel = function(data.set){  
  choices1 = c()
  choices2 = c()
  if(!is.null(data.set)&&!is.null(ncol(data.set))&&ncol(data.set)>0){
    choices1 = get.categorical.column.names(data.set)
  }else{
    choices1 = c()
  }
  list(helpText("Select a column from the first dropdown menu. As many input 
                variable will appear as there are factors in the selected 
                column. Rename the factors using the text files next to it."),
       selectInput("select.rename.column","Select Column",
                   choices=c("",choices1),multiple=F,selectize=F,selected=1),
       br(),
       uiOutput(outputId="rename.factors.inputs"),
       actionButton("rename.levs","Rename levels"),br(),br(),
       help.display('Rename Levels','rename_levels',"panels/E1_CategoricalVariables/6_rename.levels.help.md"),br(),HTML(""))
}

rename.levels.main.panel = function(){
  verbatimTextOutput("text_rename")
}

rename.factors.textfields = function(factors){
  ret = list()
  for(fac in 1:length(factors)){
    ret[[fac]] = textInput(inputId=paste0("factor",fac),label=factors[fac],value=factors[fac])
  }
  ret
}