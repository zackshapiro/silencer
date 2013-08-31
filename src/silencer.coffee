namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top

namespace 'Silencer', (exports, top) ->
  # `exports` is where you attach namespace members
  exports.term_vars = []
  exports.terms = -> exports.term_vars

$ ->

  injectZepto = ->
    script = document.createElement("script")
    script.type = "text/javascript"
    script.src = "/lib/zepto.min.js"

    scriptAlt = document.createElement("scriptAlt")
    scriptAlt.type = "text/javascript"
    scriptAlt.src = "/lib/zepto-slides.min.js"

    document.getElementsByTagName("head")[0].appendChild(script)
    document.getElementsByTagName("head")[0].appendChild(scriptAlt)

  sendUserInfo = ->
    if localStorage['silencerAuth']
      chrome.runtime.sendMessage({userInfo: true, user: localStorage['silencerAuth']})
      localStorage.clear()

  getTerms = ->
    chrome.runtime.sendMessage({contentScriptMutesRequest: true})

  detectSite = ->
    if document.URL.indexOf('facebook') > -1
      filterFacebook()
      setInterval(filterFacebook, 2500)

    if document.URL.indexOf('twitter') > -1
      filterTwitter()
      setInterval(filterTwitter, 2500)

    if document.URL.indexOf("silencer.io/auth") > -1
      setInterval(sendUserInfo, 1500)

    if document.URL.indexOf("localhost:3001/auth") > -1
      setInterval(sendUserInfo, 1500)

  hideChild = (child) -> child.slideUp()

  genericFilter = (parentDiv) ->
    getTerms()
    parent = parentDiv
    children = parentDiv.children()

    for child in children
      for term in @Silencer.terms()
        if $(child).css('display') != 'none'
          if $($(child)).text().toLowerCase().indexOf(term) > -1
            unless $(child).find('.fullname').text() == $('.js-mini-current-user .fullname').first().text()
              hideChild($(child))
              chrome.runtime.sendMessage({termSlidUp: "#{term}", site: "twitter"})

  ################## Filters ############################

  filterTwitter = ->
    # If you're on the main Twitter timeline or doing a search
    if $(".route-home").length || document.URL.indexOf("twitter.com/search") > -1 || $('.list-stream').length
      genericFilter($('.stream-items')) 

  filterFacebook = ->
    getTerms()
    stream = $(".uiStream")
    children = $(stream).children(".genericStreamStory")
    likeDiv = $('.UFIFirstComponent')

    for child in children
      for term in @Silencer.terms()
        if $(child).css('display') != 'none'
          if $(child).text().toLowerCase().indexOf(term.toLowerCase()) > -1
            unless $(child).find(likeDiv).text().toLowerCase().indexOf(term) > -1
              hideChild($(child))
              chrome.runtime.sendMessage({termSlidUp: "#{term}", site: "facebook"})

  #######################################################

  ## Init code stars here ##

  chrome.extension.onMessage.addListener (message, sender) ->
    # less data you move around, the faster it is
    if message.terms
      @Silencer.term_vars = message.terms

  detectSite()
