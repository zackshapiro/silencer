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
    "4sq.com",
    "vine.co",
    "@vine",
    "Andrew Hyde",
    "@andrewhyde",
    "#sxsw",
    "#sxsw2013",
    "SXSW",
    "humblebrag",
    "who.unfollowed.me",
    "Pope",
    "Google Reader",
    "Samsung",
    "@ttunguz",
    "@chexee"
  ]

  hideChild = (child) ->
    child.hide()

  addTerm = (newTerm, myFilteredTerms) ->
    # if $(myFilteredTerms).indexOf(newTerm.toLowerCase()) == 1
    #   alert "You're already filtering that term"
    # else 
    myFilteredTerms.push(newTerm)
    console.log myFilteredTerms

  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
    console.log message
    if message != "showTerms"
      newFilteredTermList = addTerm(message, myFilteredTerms)
      sendResponse(newFilteredTermList)
    else
      sendResponse(myFilteredTerms)

  # for Twitter
  if $(".stream-items").children().length > 0
    tweets = $(".stream-items")
    tweetsArray = tweets.children()
    tweetsLength = tweetsArray.length

    for tweet in tweetsArray
      for term in myFilteredTerms
        if $(tweet).is(":visible")
          if $($(tweet)).text().toLowerCase().indexOf(term.toLowerCase()) > -1 then hideChild($(tweet))

