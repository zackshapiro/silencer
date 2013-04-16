$ ->

  supportedSites = ->
    ["twitter", "espn.go", "instapaper"]

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
    localStorage.setItem("myFilteredTerms", JSON.stringify(terms))

  getTerms = (myFilteredTerms) ->
    myList = localStorage.getItem("myFilteredTerms")
    myNewList = JSON.parse(myList)
    terms = []
    # put all the terms in an array
    terms.push(item['term'].toLowerCase()) for item in myNewList
    # returns an array of terms
    terms

  addTerm = (newTerm, termArray) ->
    # for term in termArray
      # if filteredTerm['term'].indexOf(newTerm)
    #     alert "You're already filtering that term" 
    #     break

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

  hideChild = (child) ->
    child.slideUp()

  filterTwitter = ->
    termList = getTerms()
    if $(".stream-items").children().length > 0
      tweets = $(".stream-items")
      tweetsArray = tweets.children()

      for tweet in tweetsArray
        for term in termList
          if $(tweet).is(":visible")
            if $($(tweet)).text().toLowerCase().indexOf(term.toLowerCase()) > -1 then hideChild($(tweet))


 ## Init code stars here ##

  # grabs what's in localStorage, assigns a varible for use
  unless localStorage['myFilteredTerms']
    first = { "term": "please enter a term to filter" }
    localStorage.setItem('myFilteredTerms', JSON.stringify(first))


  if document.URL.indexOf('espn.go') > -1
    injectJquery()

    headlines = $('.headlines')
    if headlines.length > 0
      alert "injection worked"


  # Filter once, then every 4 seconds
  if document.URL.indexOf('twitter') > -1
    filterTwitter()
    setInterval(filterTwitter, 4000)


  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
    termArray = makeTermArray()
    console.log message
    if message != "showTerms"
      if message.substring(0,3) == "add"
        message = message.slice(3)
        addTerm(message, termArray)
        sendResponse(termArray)
      else if message.substring(0,6) == "remove"
        message = message.slice(6)
        if confirm "are you sure you want to remove this filter?"
          removeTerm(message)
          sendResponse(termArray)
    else
      # gets the freshest terms
      sendResponse(getTerms())

