$ ->

  # Handles both forms of form submit. Enter or button click.
  $('.my-form').submit ->
    newTerm = $('.term-to-submit').val()    
    unless newTerm == ""
      mixpanel.track('Term Added (enter pressed)', {"id": newTerm}) # This isn't working, get it working

      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "add" + newTerm,
            (response) ->
              console.log response
          )
      )

  $('.submit').click -> 
    newTerm = $('.term-to-submit').val()    
    unless newTerm == ""
      mixpanel.track('Term Added (button)', {"id": newTerm})

      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "add" + newTerm,
            (response) ->
              console.log (JSON.stringify(response))
              $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm}", "text": "#{newTerm}"} ))
              $(".terms").children().last().append($('<a></a>', {"href": "#", "class": "remove-term", "text": "x"} ))
          )
      )

  chrome.tabs.query("active": true, "currentWindow": true,
  (tab) -> 
    chrome.tabs.sendMessage(tab[0].id, "showTerms", 
      (response) ->
        console.log (JSON.stringify(response))
        terms = response
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


