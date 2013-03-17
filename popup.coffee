$ ->

  $('.submit').click ->
    newTerm = $('.term-to-submit').val()    
    unless newTerm == ""
      chrome.tabs.query("active": true, "currentWindow": true,
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, newTerm,
            (response) ->
              console.log response
          )
      )

  chrome.tabs.query("active": true, "currentWindow": true,
  (tab) -> 
    chrome.tabs.sendMessage(tab[0].id, "showTerms", 
      (response) ->
        console.log (JSON.stringify(response))
        terms = response
        for term in terms
          $(".terms").append($('<li></li>', {"class": "term", "text": "#{term}"}))
    )
  )