$ ->

  ################## Filter Packs  ############################  
  # no capital letters
  thronesFilter = [ "game of thrones", "of thrones", "#got", "little finger", "song of fire and ice", "sofai", "sofi", "lannister", "stark", "baratheon", "shae", "bronn", "cersei", "tyrion", "kingslayer", "king slayer", "margaery", "robb stark", "king of the north", "stannis", "daenerys", "khaleesi", "theon", "greyjoy", "grey joy", "gray joy", "grayjoy", "tyrell", "sansa", "arya", "jon snow", "brienne", "bran", "ygritte", "renly", "joffrey", "melisandre", "lord of light", "@gameofthrones", "#asoiaf", "dragon", "gotfans", "gameofthrones", "westeros", "joffrey", "red wedding", "redwedding", "gameofthronesfilter"]
  
  madMenFilter = [ "#madmen", "don draper", "betty draper", "january jones", "jon hamm", "john hamm", "roger sterling", "joan", "joan harris", "peggy olsen", "peggy", "pete cambpell", "ken cosgrove", "harry crane", "henry francis", "betty francis", "megan draper", "jessica par", "sally draper", "dick whitman", "#madmenspoilers", "bobby draper", "michael ginsberg", "jane sterling", "john slattery", "bert cooper", "bertram cooper", "robert morse", "trudy cambpell", "megan", "don", "sterling", "campbell", "sterling cooper", "sterling cooper draper price", "scdp", "madmenfilter" ]

  arrestedDevelopmentFilter = [ "#arresteddevelopment", "bluth", "banana stand", "lucille", "gob", "george michael", "maebe", "maybe funke", "george sr", "george senior", "oscar bluth", "oscar", "buster", "baby buster", "boy fights", "tobias", "funke", "fünke", "bluth company", "mister f", "mrf", "ad2013", "mitch hurwitz", "mitch", "@mitchhurwitz", "stair car", "lucille two", "lucille 2", "lucille austero", "@arresteddev", "arrested development season 4", "magic", "illusion", "anustart", "a new start", "fake block", "fakeblock", "george maharis", "george maharris", "arresteddevelopmentfilter" ]
  
  prettyLittleLiarsFilter = [ "@abcfpll", "pll", "pretty little liars", "#prettylittleliars", "alison", "#pllfamily", "spencer hastings", "spencer", "hanna marin", "hanna", "hannah", "emily fields", "aria", "aria montgomery", "mona", "vanderwaal", "vanderwall", "sara shepard", "marline king", "rosewood", "'a'", "prettylittleliarsfilter"]

  trueBloodFilter = [ "true blood", "#trueblood", "@truebloodhbo", "trueblood", "sookie", "sookie stackhouse", "bill compton", "northman", "tara thornton", "merlotte", "stackhouse", "lafayette", "arlene", "arlene fowler", "bellefleur", "hoyt", "lettie mae", "lettie mae thornton", "rene", "bud", "bud dearborne", "dawn", "amy", "amy burley", "adele", "eddie", "bellefleur", "jessica hamby", "reverend newlin", "reverend steve", "de beaufort", "pam swynford", "russell", "alcide", "holly", "luna", "nora", "niall", "nial", "nile", "truman", "rikki", "ricky", "herveaux", "ben flynn", "nicole wright", "truebloodfilter" ]

  reservedWords = [ "reply", "retweet", "favorite", "expand", "more", "like", "comment", "share"]

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
    script.src = "/lib/jquery-1.9.1.min.js"
    body = document.getElementsByTagName("body")[0]
    body.appendChild(script)

  detectSite = ->
    if document.URL.indexOf('facebook') > -1
      injectJquery()
      filterFacebook()
      setInterval(filterFacebook, 4000)

    if document.URL.indexOf('twitter') > -1
      filterTwitter()
      setInterval(filterTwitter, 4000)

    if document.URL.indexOf("http://localhost:3000/auth") > -1
      if localStorage['silencerAuth']
        chrome.runtime.sendMessage({userInfo: true, user: localStorage['silencerAuth']})

        # need time delay to capture when the user comes here
        # for the first time and

  storeTerms = (terms) ->
    # stores terms in LS
    localStorage.setItem("silencer", JSON.stringify(terms))

  getTerms = ->
    # adds a term if localStorage is empty 
    unless localStorage["silencer"]
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
    addGoTFilter() if action == "got-add"
    removeGoTFilter() if action == "got-remove"

    addMmFilter() if action == "mm-add"
    removeMmFilter() if action == "mm-remove"

    addAdFilter() if action == "ad-add"
    removeAdFilter() if action == "ad-remove"

    addPllFilter() if action == "pll-add"
    removePllFilter() if action == "pll-remove"

    addTbFilter() if action == "tb-add"
    removeTbFilter() if action == "tb-remove"


    addTerm("instagram.com") if action == "instagram-add"
    removeTerm("instagram.com") if action == "instagram-remove"

    addTerm("vine.co") if action == "vine-add"
    removeTerm("vine.co") if action == "vine-remove"

    addTerm("4sq.com") if action == "4sq-add"
    removeTerm("4sq.com") if action == "4sq-remove"

    addTerm("path.com") if action == "path-add"
    removeTerm("path.com") if action == "path-remove"

    addTerm("t.imehop.com") if action == "timehop-add"
    removeTerm("t.imehop.com") if action == "timehop-remove"

    addTerm("medium.com") if action == "medium-add"
    removeTerm("medium.com") if action == "medium-remove"

    addTerm("go.nike.com") if action == "nike-add"
    removeTerm("go.nike.com") if action == "nike-remove"

    addTerm("cir.ca") if action == "circa-add"
    removeTerm("cir.ca") if action == "circa-remove"

    addTerm("paper.li") if action == "paper-add"
    removeTerm("paper.li") if action == "paper-remove"


  addGoTFilter = -> addTerm(item) for item in thronesFilter
  removeGoTFilter = -> removeTerm(item) for item in thronesFilter

  addMmFilter = -> addTerm(item) for item in madMenFilter
  removeMmFilter = -> removeTerm(item) for item in madMenFilter

  addAdFilter = -> addTerm(item) for item in arrestedDevelopmentFilter
  removeAdFilter = -> removeTerm(item) for item in arrestedDevelopmentFilter

  addPllFilter = -> addTerm(item) for item in prettyLittleLiarsFilter
  removePllFilter = -> removeTerm(item) for item in prettyLittleLiarsFilter

  addTbFilter = -> addTerm(item) for item in trueBloodFilter
  removeTbFilter = -> removeTerm(item) for item in trueBloodFilter


  addTerm = (newTerm) ->
    termArray = makeTermArray()

    for term in termArray
      return if newTerm.toLowerCase() == term.term # because format is {term: "#sxsw"}

    for term in reservedWords
      return if newTerm.toLowerCase() == term

    # adds an item to the array above
    termArray.push({ "term": newTerm })
    storeTerms(termArray)

  removeTerm = (termToBeRemoved) ->
    terms = getTerms()

    for term in terms
      terms.remove(term) if term == termToBeRemoved

    # creates a new term array and stores it
    newTermList = []
    for term in terms
      newTermList.push({ "term": term})
    storeTerms(newTermList)

  makeTermArray = ->
    termArray = []
    terms = getTerms()
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
          if $($(child)).text().toLowerCase().indexOf(term.toLowerCase()) > -1
            hideChild($(child)) 
            chrome.runtime.sendMessage({term: "#{term}", site: "twitter"})


  ################## Filters ############################

  filterTwitter = ->
    # If you're on the main Twitter timeline or doing a search
    if $(".route-home").length || document.URL.indexOf("twitter.com/search") > -1 || $('.list-stream')
      genericFilter($('.stream-items')) 

  filterFacebook = ->
    terms = getTerms()
    stream = $(".uiStream")
    children = $(stream).children(".genericStreamStory")

    for child in children
      for term in terms
        if $(child).is(":visible")
          if $(child).text().toLowerCase().indexOf(term.toLowerCase()) > -1
            hideChild($(child))
            chrome.runtime.sendMessage({term: "#{term}", site: "facebook"})

  #######################################################


  ## Init code stars here ##

  # detects what URL the user is on
  detectSite()

  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->

    if message == "showTerms"
      # gets the freshest terms
      sendResponse(getTerms())
    else
      if message.substring(0,3) == "add"
        message = message.slice(3)
        addTerm(message)
        sendResponse(makeTermArray())

      else if message.substring(0,6) == "remove"
        message = message.slice(6)
        removeTerm(message)
        sendResponse(makeTermArray())

    if message.substring(0,6) == "filter"
      message = message.slice(6)
      toggleMutePack(message)
