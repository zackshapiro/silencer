$ ->

  # TO DO: Convert search terms to lowercase
  filterTerms = [
    "Apple",
    "Frank Chimero",
    "Coke",
    "Privacy",
    "San Francisco",
    "Canon",
    "4sq.com",
    "vine.co",
    "Andrew Hyde",
    "#sxsw",
    "#sxsw2013",
    "instagr.am"
  ]

  # chrome.extension.sendMessage({greeting: "hello"}, (response) -> console.log(response.farewell))

  hideChild = (child) ->
    child.hide()

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
        # if $($(tweet).find(".js-tweet-text")).text().indexOf(term) > -1 then hideChild($(tweet))
        # if $($(tweet).find(".fullname")).text().indexOf(term) > -1 then hideChild($(tweet))
        if $($(tweet)).text().indexOf(term) > -1 then hideChild($(tweet))
        if $($(tweet).find("js-index-of")).text().indexOf(term) > -1 then hideChild($(tweet))

        # I can do this too $(".stream-items").children().first().text().indexOf("theeconomist")
        # searches the entire tweet, don't have to specify class names or ids