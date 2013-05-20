$ ->

  newTerm = -> $('.term-to-submit').val()

  $('.term-to-submit').keyup (event) ->
    $('.primary.button.submit').text("Mute #{newTerm()}")

  # Handles both forms of form submit. Enter or button click.
  $('.my-form').submit ->
    unless newTerm() == ""
      mixpanel.track('Term Added (enter pressed)', {"id": newTerm()}) # This isn't working, get it working

      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "add" + newTerm(),
            (response) ->
              console.log response
          )
      )

  $('.term.submit').click -> 
    unless newTerm() == ""
      mixpanel.track('Term Added (button)', {"id": newTerm()})

      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "add" + newTerm(),
            (response) ->
              console.log (JSON.stringify(response))
              $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm()}", "text": "#{newTerm()}"} ))
              $(".terms").children().last().append($('<a></a>', {"href": "#", "class": "remove-term", "text": "x"} ))
          )
      )

  chrome.tabs.query("active": true, "currentWindow": true,
  (tab) -> 
    chrome.tabs.sendMessage(tab[0].id, "showTerms", 
      (response) ->
        console.log (JSON.stringify(response))
        terms = response
        # here I have the terms, maybe put them in localStorage? They should at least be stored in a public variable

        for term in terms
          $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{term}", "text": "#{term}"} ))

        for child in $(".terms").children()
          $(child).append($('<a></a>', {"href": "#", "class": "remove-term", "text": "x"} ))

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
          (response) ->
            console.log response
        )
    )
  ))

  $('.add-got').click (e) ->
    debugger
    e.preventDefault()

    if $('.add-got').text() == "Add"
      mixpanel.track("GoT Filter Added")
    
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtergot-add",
            (response) ->
              console.log ""
          )
      )

      $(".add-got").text("Remove")
    else
      mixpanel.track("GoT Filter Removed")

      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtergot-remove",
            (response) ->
              console.log ""
          )
      )

      $(".add-got").text("Add")



  $('.add-mm').click (e) ->
    e.preventDefault()

    if $('.add-mm').text() == "Add"
      mixpanel.track("Man Men Filter Added")
    
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtermm-add",
            (response) ->
              console.log ""
          )
      )

      $(".add-mm").text("Remove")
    else
      mixpanel.track("Mad Men Filter Removed")

      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filtermm-remove",
            (response) ->
              console.log ""
          )
      )

      $(".add-mm").text("Add")










  # $('.login.submit').click ->
  #   email = $('#username-to-submit').val()
  #   password = $('#password-to-submit').val()

  #   chrome.tabs.query("active": true, "currentWindow": true, 
  #     (tab) ->
  #       chrome.tabs.sendMessage(tab[0].id, email,
  #         (response) ->
  #           console.log response
  #       )
  #       chrome.tabs.sendMessage(tab[0].id, password,
  #         (response) ->
  #           console.log response
  #       )
  #   )