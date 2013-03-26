$ ->

  # reservedWords = [
  #   "favorite",
  #   "like",
  #   "retweet",
  #   "silencer",
  #   "reply",
  #   "view summary",
  #   "expand",
  #   "add",
  #   "remove",
  #   "view conversation"
  # ]

  Array.prototype.remove = ->
    while (arguments.length && this.length)
      what = arguments[--arguments.length]
      while ((ax = @.indexOf(what)) != -1 )
        this.splice(ax, 1)
    return this

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
    child.hide()

  filterTwitter = (termList) ->
    # for Twitter
    if $(".stream-items").children().length > 0
      tweets = $(".stream-items")
      tweetsArray = tweets.children()
      tweetsLength = tweetsArray.length

      for tweet in tweetsArray
        for term in termList
          if $(tweet).is(":visible")
            if $($(tweet)).text().toLowerCase().indexOf(term.toLowerCase()) > -1 then hideChild($(tweet))



 # Init code stars here 
  # grabs what's in localStorage, assigns a varible for use
  if localStorage['myFilteredTerms']
    termList = getTerms() 
  else
    first = { "term": "please enter a term to filter" }
    localStorage.setItem('myFilteredTerms', JSON.stringify(first))
    termList = getTerms() 

 # Filters terms
  filterTwitter(termList)

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
        removeTerm(message)
        sendResponse(termArray)
    else
      sendResponse(termList)

