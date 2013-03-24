$ ->

  # reservedWords = [
  #   "favorite",
  #   "like",
  #   "retweet",
  #   "reply",
  #   "view summary",
  #   "expand",
  #   "view conversation"
  # ]

  storeTerms = (terms) ->
    # stores terms in LS
    localStorage.setItem("myFilteredTerms", JSON.stringify(terms))

  getTerms = (myFilteredTerms) ->
    myList = localStorage.getItem("myFilteredTerms")
    myNewList = JSON.parse(myList)
    terms = []
    # put all the terms in an array
    terms.push(item['term']) for item in myNewList
    # returns an array of terms
    terms

  addTerm = (newTerm, myFilteredTerms) ->
    # for filteredTerm in myFilteredTerms
    #   if filteredTerm['term'].indexOf(newTerm)
    #     alert "You're already filtering that term" 
    #     break

    # adds an item to the array above
    myFilteredTerms.push({ "term": newTerm })
    # stores that array in LS
    storeTerms(myFilteredTerms)

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
  termList = getTerms(localStorage['myFilteredTerms']) if localStorage['myFilteredTerms']

 # Filters terms
  filterTwitter(termList)

  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
    termArray = makeTermArray()
    console.log message
    if message != "showTerms"
      addTerm(message, termArray)
      sendResponse(termArray)
      # filterTwitter(getTerms(newFilteredTermList))
    else
      sendResponse(termList)

