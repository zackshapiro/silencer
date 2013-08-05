$ ->

  injectJquery = ->
    script = document.createElement("script")
    script.type = "text/javascript"
    script.src = "/lib/jquery-1.9.1.min.js"
    body = document.getElementsByTagName("body")[0]
    body.appendChild(script)

  sendUserInfo = ->
    if localStorage['silencerAuth']
      chrome.runtime.sendMessage({userInfo: true, user: localStorage['silencerAuth']})

  detectSite = ->
    if document.URL.indexOf('facebook') > -1
      injectJquery()
      filterFacebook()
      setInterval(filterFacebook, 4000)

    if document.URL.indexOf('twitter') > -1
      filterTwitter()
      setInterval(filterTwitter, 4000)

    if document.URL.indexOf("localhost:3000/auth") > -1
      setInterval(sendUserInfo, 1500)

    if document.URL.indexOf("silencer.io/auth") > -1
      setInterval(sendUserInfo, 1500)

  # getTerms = ->
  

  hideChild = (child) -> child.slideUp()

  genericFilter = (parentDiv) ->
    # terms = getTerms() # REMEMBER TO REWRITE
    terms = ["gaogahgahoga", "agoaghaohao"] # REMEMBER TO REMOVE
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
    if $(".route-home").length || document.URL.indexOf("twitter.com/search") > -1 || $('.list-stream').length
      genericFilter($('.stream-items')) 

  filterFacebook = ->
    # terms = getTerms()
    terms = ["gaogahgahoga", "agoaghaohao"]
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
