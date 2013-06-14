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
        if response
          terms = response

          for term in terms
            $(".add-nba").text("Unmute") if term == "nbafinalsfilter"
            $(".add-got").text("Unmute") if term == "gameofthronesfilter"
            $(".add-mm").text("Unmute") if term == "madmenfilter"
            $(".add-ad").text("Unmute") if term == "arresteddevelopmentfilter"
            $(".add-pll").text("Unmute") if term == "prettylittleliarsfilter"

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
    $(e.currentTarget).parent().slideUp()
    
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
    if $('.add-got').text() == "Mute"
      mixpanel.track("GoT Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtergot-add")
      )
      $(".add-got").text("Unmute")
    else
      mixpanel.track("GoT Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtergot-remove")
      )
      $(".add-got").text("Mute")



  $('.add-mm').click (e) ->
    e.preventDefault()
    if $('.add-mm').text() == "Mute"
      mixpanel.track("Man Men Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtermm-add")
      )
      $(".add-mm").text("Unmute")
    else
      mixpanel.track("Mad Men Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtermm-remove")
      )
      $(".add-mm").text("Mute")


  $('.add-ad').click (e) ->
    e.preventDefault()
    if $('.add-ad').text() == "Mute"
      mixpanel.track("Arrested Development Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filterad-add")
      )
      $(".add-ad").text("Unmute")
    else
      mixpanel.track("Arrested Development Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filterad-remove")
      )
      $(".add-ad").text("Mute")


  $('.add-nba').click (e) ->
    e.preventDefault()
    if $('.add-nba').text() == "Mute"
      mixpanel.track("NBA Finals Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filternba-add")
      )
      $(".add-nba").text("Unmute")
    else
      mixpanel.track("NBA Finals Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filternba-remove")
      )
      $(".add-nba").text("Mute")


  $('.add-pll').click (e) ->
    e.preventDefault()
    if $('.add-pll').text() == "Mute"
      mixpanel.track("Pretty Little Liars Filter Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filterpll-add")
      )
      $(".add-pll").text("Unmute")
    else
      mixpanel.track("Pretty Little Liars Filter Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filterpll-remove")
      )
      $(".add-pll").text("Mute")



