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

  toggleMutePack = (action) ->
    addGoTFilter() if action == "got-add"
    removeGoTFilter() if action == "got-remove"

    addMmFilter() if action == "mm-add"
    removeMmFilter() if action == "mm-remove"

    addAdFilter() if action == "ad-add"
    removeAdFilter() if action == "ad-remove"

    addPllFilter() if action == "pll-add"
    removePllFilter() if action == "pll-remove"

    addTbFilter() if action == "tb-add"
    removeTbFilter() if action == "tb-remove"

    addRoyalBabyFilter() if action == "rb-add"
    removeRoyalBabyFilter() if action == "rb-remove"


    addTerm("instagram.com") if action == "instagram-add"
    removeTerm("instagram.com") if action == "instagram-remove"

    addTerm("vine.co") if action == "vine-add"
    removeTerm("vine.co") if action == "vine-remove"

    addTerm("4sq.com") if action == "4sq-add"
    removeTerm("4sq.com") if action == "4sq-remove"

    addTerm("path.com") if action == "path-add"
    removeTerm("path.com") if action == "path-remove"

    addTerm("t.imehop.com") if action == "timehop-add"
    removeTerm("t.imehop.com") if action == "timehop-remove"

    addTerm("medium.com") if action == "medium-add"
    removeTerm("medium.com") if action == "medium-remove"

    addTerm("go.nike.com") if action == "nike-add"
    removeTerm("go.nike.com") if action == "nike-remove"

    addTerm("cir.ca") if action == "circa-add"
    removeTerm("cir.ca") if action == "circa-remove"

    addTerm("paper.li") if action == "paper-add"
    removeTerm("paper.li") if action == "paper-remove"


  addGoTFilter = -> addTerm(item) for item in thronesFilter
  removeGoTFilter = -> removeTerm(item) for item in thronesFilter

  addMmFilter = -> addTerm(item) for item in madMenFilter
  removeMmFilter = -> removeTerm(item) for item in madMenFilter

  addAdFilter = -> addTerm(item) for item in arrestedDevelopmentFilter
  removeAdFilter = -> removeTerm(item) for item in arrestedDevelopmentFilter

  addPllFilter = -> addTerm(item) for item in prettyLittleLiarsFilter
  removePllFilter = -> removeTerm(item) for item in prettyLittleLiarsFilter

  addTbFilter = -> addTerm(item) for item in trueBloodFilter
  removeTbFilter = -> removeTerm(item) for item in trueBloodFilter

  addRoyalBabyFilter = -> addTerm(item) for item in royalBabyFilter
  removeRoyalBabyFilter = -> removeTerm(item) for item in royalBabyFilter
  

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
