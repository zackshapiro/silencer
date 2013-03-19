$ ->

  reservedWords = [
    "favorite",
    "like",
    "retweet",
    "reply",
    "view summary",
    "expand",
    "view conversation"
  ]

  myFilteredTerms = [
    { "term": "4sq.com" },
    { "term": "vine.co" },
    { "term": "@vine" },
    { "term": "Andrew Hyde" },
    { "term": "@andrewhyde" },
    { "term": "#sxsw" },
    { "term": "#sxsw2013" },
    { "term": "SXSW" },
    { "term": "humblebrag" },
    { "term": "who.unfollowed.me" },
    { "term": "Pope" },
    { "term": "Google Reader" },
    { "term": "Samsung" },
    { "term": "@ttunguz" },
    { "term": "@chexee" },
    { "term": "rape" }
  ]

  storeTerms = (myFilteredTerms) ->
  localStorage.setItem("myFilteredTerms", JSON.stringify(myFilteredTerms))

  getTerms = (myFilteredTerms) ->
    myList = localStorage.getItem("myFilteredTerms")
    myNewList = JSON.parse(myList)
    terms = []
    # put all the terms in an array
    for item in myNewList
      terms.push(item['term'])
    # returns an array of terms
    terms

  hideChild = (child) ->
    child.hide()

  addTerm = (newTerm, myFilteredTerms) ->
    if myFilteredTerms.indexOf(newTerm.toLowerCase()) > -1
      alert "You're already filtering that term"
    else 
      myFilteredTerms.push(newTerm)

  filterTwitter = (myFilteredTerms) ->
    # for Twitter
    if $(".stream-items").children().length > 0
      tweets = $(".stream-items")
      tweetsArray = tweets.children()
      tweetsLength = tweetsArray.length

      for tweet in tweetsArray
        for term in termListToUse
          if $(tweet).is(":visible")
            if $($(tweet)).text().toLowerCase().indexOf(term.toLowerCase()) > -1 then hideChild($(tweet))

 # Init code stars here 
  if localStorage.getItem('myFilteredTerms') == null
    storeTerms(myFilteredTerms)
  else
    # This is the acting variable used to filter
    termListToUse = getTerms(myFilteredTerms)

  filterTwitter(termListToUse)

  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
    console.log message
    if message != "showTerms"
      newFilteredTermList = addTerm(message, termListToUse)
      sendResponse(newFilteredTermList)
      # location.reload()
      # filterTwitter(newFilteredTermList)
    else
      sendResponse(termListToUse)

