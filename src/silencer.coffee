$ ->

  injectJquery = ->
    # only do this on sites that qualify for Silencer

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
      setInterval(filterFacebook, 2500)

    if document.URL.indexOf('twitter') > -1
      filterTwitter()
      setInterval(filterTwitter, 2500)

    if document.URL.indexOf("localhost:3001/auth") > -1
      setInterval(sendUserInfo, 1500)

    if document.URL.indexOf("silencer.io/auth") > -1
      setInterval(sendUserInfo, 1500)

  getTerms = (callback) ->
    debugger
    chrome.runtime.sendMessage({contentScriptMutesRequest: true})

    chrome.extension.onMessage.addListener (message, sender) ->
      callback message.user.mutes if message.user

  hideChild = (child) -> child.slideUp()

  genericFilter = (parentDiv) ->
    getTerms( (terms) ->
      parent = parentDiv
      children = parentDiv.children()
      console.log terms # each time this runs, it does it one more time than the last time. bad.

      # The problem is that each time this runs, it logs an additional thing. First time 1 log, 2nd time 3 total logs, 3rd time 6 total logs
      # I want to store the value of the callback somewhere to reference each time so I don't have to keep doing a callback

      for child in children
        for term in terms
          if $(child).is(":visible")
            if $($(child)).text().toLowerCase().indexOf(term) > -1
              hideChild($(child)) 
              chrome.runtime.sendMessage({termSlidUp: "#{term}", site: "twitter"})
    )


  ################## Filters ############################

  filterTwitter = ->
    # If you're on the main Twitter timeline or doing a search
    if $(".route-home").length || document.URL.indexOf("twitter.com/search") > -1 || $('.list-stream').length
      genericFilter($('.stream-items')) 

  filterFacebook = ->
    getTerms( (terms) ->
      stream = $(".uiStream")
      children = $(stream).children(".genericStreamStory")

      for child in children
        for term in terms
          if $(child).is(":visible")
            if $(child).text().toLowerCase().indexOf(term.toLowerCase()) > -1
              hideChild($(child))
              chrome.runtime.sendMessage({termSlidUp: "#{term}", site: "facebook"})
    )

  #######################################################

  ## Init code stars here ##

  # detects what URL the user is on
  detectSite()
