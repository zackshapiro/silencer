$ ->

  ################## Filter Packs  ############################  
  # no capital letters
  thronesFilter = [ "game of thrones", "of thrones", "#got", "little finger", "song of fire and ice", "sofai", "sofi", "lannister", "stark", "baratheon", "shae", "bronn", "cersei", "tyrion", "kingslayer", "king slayer", "margaery", "robb stark", "king of the north", "stannis", "daenerys", "khaleesi", "theon", "greyjoy", "grey joy", "gray joy", "grayjoy", "tyrell", "sansa", "arya", "jon snow", "brienne", "bran", "ygritte", "renly", "joffrey", "melisandre", "lord of light", "@gameofthrones", "#asoiaf", "dragon", "gotfans", "gameofthrones", "westeros", "joffrey", "gameofthronesfilter"]
  
  madMenFilter = [ "#madmen", "don draper", "betty draper", "january jones", "jon hamm", "john hamm", "roger sterling", "joan", "joan harris", "peggy olsen", "peggy", "pete cambpell", "ken cosgrove", "harry crane", "henry francis", "betty francis", "megan draper", "jessica par", "sally draper", "dick whitman", "#madmenspoilers", "bobby draper", "michael ginsberg", "jane sterling", "john slattery", "bert cooper", "bertram cooper", "robert morse", "trudy cambpell", "megan", "don", "sterling", "campbell", "sterling cooper", "sterling cooper draper price", "scdp", "madmenfilter" ]

  arrestedDevelopmentFilter = [ "#arresteddevelopment", "bluth", "banana stand", "lucille", "gob", "george michael", "maebe", "maybe funke", "george sr", "george senior", "oscar bluth", "oscar", "buster", "baby buster", "boy fights", "tobias", "funke", "fünke", "bluth company", "mister f", "mrf", "ad2013", "mitch hurwitz", "mitch", "@mitchhurwitz", "stair car", "lucille two", "lucille 2", "lucille austero", "@arresteddev", "arrested development season 4", "magic", "illusion", "arresteddevelopmentfilter" ]
  
  ##############################################

  Array.prototype.remove = ->
    while (arguments.length && this.length)
      what = arguments[--arguments.length]
      while ((ax = @.indexOf(what)) != -1 )
        this.splice(ax, 1)
    return this

  injectJquery = ->
    script = document.createElement("script")
    script.type = "text/javascript"
    script.src = "/lib/jquery-1.9.1.min.js";
    body = document.getElementsByTagName("body")[0]
    body.appendChild(script)

  storeTerms = (terms) ->
    # stores terms in LS
    localStorage.setItem("silencer", JSON.stringify(terms))

  getTerms = ->
    # grabs what's in localStorage, assigns a varible for use
    unless localStorage['silencer']
      first = { "term": "sample muted term" }
      localStorage.setItem('silencer', JSON.stringify(first))

    myList = localStorage.getItem("silencer") 

    myNewList = JSON.parse(myList)
    terms = []
    # put all the terms in an array
    terms.push(item['term'].toLowerCase()) for item in myNewList
    # returns an array of terms
    terms

  toggleMutePack = (action) ->
    addsGoTFilter() if action == "got-add"
    removeGoTFilter() if action == "got-remove"

    addMmFilter() if action == "mm-add"
    removeMmFilter() if action == "mm-remove"

    addAdFilter() if action == "ad-add"
    removeAdFilter() if action == "ad-remove"


  addGoTFilter = ->
    addTerm(item) for item in thronesFilter

  removeGoTFilter = ->
    removeTerm(item) for item in thronesFilter

  addMmFilter = ->
    addTerm(item) for item in madMenFilter

  removeMmFilter = ->
    removeTerm(item) for item in madMenFilter

  addAdFilter = ->
    addTerm(item) for item in arrestedDevelopmentFilter

  removeAdFilter = ->
    removeTerm(item) for item in arrestedDevelopmentFilter


  addTerm = (newTerm) ->
    termArray = makeTermArray()
    # adds an item to the array above
    termArray.push({ "term": newTerm })
    # stores that array in LS
    storeTerms(termArray)

  removeTerm = (termToBeRemoved) ->
    terms = getTerms()
    # removes term
    for term in terms
      terms.remove(term) if term == termToBeRemoved

    # creates a new term array and stores it
    newTermList = []
    for term in terms
      newTermList.push({ "term": term})
    storeTerms(newTermList)

  makeTermArray = ->
    termArray = []
    terms = getTerms() # ["4sq", "vine.co" ...]
    for term in terms
      termArray.push({ "term": "#{term}"})
    termArray    

  hideChild = (child) -> child.slideUp()

  genericFilter = (parentDiv) ->
    terms = getTerms()
    parent = parentDiv
    children = parentDiv.children()

    for child in children
      for term in terms
        if $(child).is(":visible")
          hideChild($(child)) if $($(child)).text().toLowerCase().indexOf(term.toLowerCase()) > -1


  ################## Filters ############################

  filterTwitter = ->
    # If you're on the main Twitter timeline or doing a search
    if $(".route-home").length || document.URL.indexOf("twitter.com/search") > -1
      genericFilter($('.stream-items')) 

  filterFacebook = ->
    termList = getTerms()

    stream = $(".uiStream")
    children = $(stream).children(".genericStreamStory")
    for child in children
      for term in termList
        $(child).slideUp() if $(child).text().toLowerCase().indexOf(term.toLowerCase()) > -1

  #######################################################


 ## Init code stars here ##

  base = new Firebase('https://silencerio.firebaseIO.com/')

  if document.URL.indexOf('facebook') > -1
    injectJquery()
    filterFacebook()
    setInterval(filterFacebook, 4000)

  if document.URL.indexOf('twitter') > -1
    filterTwitter()
    setInterval(filterTwitter, 4000)

  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
    termArray = makeTermArray()

    if message == "showTerms"
      # gets the freshest terms
      sendResponse(getTerms())
    else
      if message.substring(0,3) == "add"
        message = message.slice(3)
        addTerm(message)
        base.push({term: message})
        sendResponse(termArray)

      else if message.substring(0,6) == "remove"
        message = message.slice(6)
        if confirm "are you sure you want to remove this mute?"
          removeTerm(message)
          sendResponse(termArray)

    if message.substring(0,6) == "filter"
      message = message.slice(6)
      toggleMutePack(message)