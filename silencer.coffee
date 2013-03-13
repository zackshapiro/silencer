$ ->

  # TO DO: Convert search terms to lowercase
  filterTerms = [
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
    "Benny  "
  ]

  chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
    sendResponse(filterTerms)

  hideChild = (child) ->
    child.hide()

  # for Pocket
  if $('#queue').length > 0
    articles = $('#queue')
    articlesArray = articles.children()
    articlesLength = articlesArray.length

    for article in articlesArray
      for term in filterTerms
        if $($(article).find(".title").children()[0]).text().indexOf(term) > -1 then hideChild($(article))


  if $(".stream-items").children().length > 0
    tweets = $(".stream-items")
    tweetsArray = tweets.children()
    tweetsLength = tweetsArray.length

    for tweet in tweetsArray
      for term in filterTerms
        if $(tweet).is(":visible")
          if $($(tweet)).text().toLowerCase().indexOf(term.toLowerCase()) > -1 then hideChild($(tweet))

        # TODO: refactor, DRY this up

  # chrome.extension.sendMessage(
  #   greeting: "hello", 
  #   (response) ->
  #     console.log response.farewell
  #   )


        # .js-tweet-text is text of the tweet
        # .stream-item-header is Jud Valeski @judvaleski
        # .stream-item-footer is footer



# TO DO: Break these out into a function since most of it repeats
# Reserved words for Twitter's commands (like Favorite, Retweet, etc)