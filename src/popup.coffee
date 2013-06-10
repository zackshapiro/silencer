$ ->

  newTerm = -> $('.term-to-submit').val()

  focus = -> $('.term-to-submit').focus()

  $('.term-to-submit').keyup (event) ->
    $('.primary.button.submit').text("Mute #{newTerm()}")

  # Handles both forms of form submit. Enter or button click.
  $('.my-form').submit ->
    unless newTerm() == ""
      mixpanel.track('Term Added (enter pressed)', {"id": newTerm()}) # TODO: This isn't working, get it working

      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "add" + newTerm(),
            (response) -> console.log response
          )
      )

  $('.mute.submit').click ->
    unless newTerm() == ""
      mixpanel.track('Term Added (button)', {"id": newTerm()})

      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "add" + newTerm(),
            (response) ->
              console.log (JSON.stringify(response))
              $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm()}", "text": "#{newTerm()}"} ))
          )
      )

  chrome.tabs.query("active": true, "currentWindow": true,
  (tab) -> 
    chrome.tabs.sendMessage(tab[0].id, "showTerms", 
      (response) ->
        # console.log (JSON.stringify(response))
        # here I have the terms, maybe put them in localStorage? They should at least be stored in a public variable
        if response
          terms = response

          for term in terms
            $(".add-nba").text("Remove") if term == "nbafinalsfilter"
            $(".add-got").text("Remove") if term == "gameofthronesfilter"
            $(".add-mm").text("Remove") if term == "madmenfilter"
            $(".add-ad").text("Remove") if term == "arresteddevelopmentfilter"

          for term in terms
            $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{term}", "text": "#{term}"} ))

          for child in $(".terms").children()
            $(child).wrapInner("<a href='#' class='remove-term'></a>")

          mixpanel.track('Silencer Opened')
    )
  )

  $(".terms").on('click', 'li a', ( (e) => 
    e.preventDefault()
    term = $(e.currentTarget).parent().data("term")
    mixpanel.track("Term Removed", {"id": term})
    termToBeRemoved = "remove" + term
    
    chrome.tabs.query("active": true, "currentWindow": true, 
      (tab) -> 
        chrome.tabs.sendMessage(tab[0].id, termToBeRemoved,
          (response) -> console.log response
        )
    )
  ))



  ### Adding filters ### 

  $('.add-got').click (e) ->
    e.preventDefault()
    if $('.add-got').text() == "Add"
      mixpanel.track("GoT Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtergot-add")
      )
      $(".add-got").text("Remove")
    else
      mixpanel.track("GoT Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtergot-remove")
      )
      $(".add-got").text("Add")



  $('.add-mm').click (e) ->
    e.preventDefault()
    if $('.add-mm').text() == "Add"
      mixpanel.track("Man Men Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtermm-add")
      )
      $(".add-mm").text("Remove")
    else
      mixpanel.track("Mad Men Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtermm-remove")
      )
      $(".add-mm").text("Add")


  $('.add-ad').click (e) ->
    e.preventDefault()
    if $('.add-ad').text() == "Add"
      mixpanel.track("Arrested Development Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filterad-add")
      )
      $(".add-ad").text("Remove")
    else
      mixpanel.track("Arrested Development Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filterad-remove")
      )
      $(".add-ad").text("Add")


  $('.add-nba').click (e) ->
    e.preventDefault()
    if $('.add-nba').text() == "Add"
      mixpanel.track("NBA Finals Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filternba-add")
      )
      $(".add-nba").text("Remove")
    else
      mixpanel.track("NBA Finals Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filternba-remove")
      )
      $(".add-nba").text("Add")

