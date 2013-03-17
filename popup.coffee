$ ->
  terms = chrome.tabs.query(
    "active": true,
    "currentWindow": true,
    (tab) -> 
      chrome.tabs.sendMessage(tab[0].id, "stuff", 
        (response) ->
          console.log (JSON.stringify(response))
          terms = response
          for term in terms
            $(".terms").append($('<li></li>', {"class": "term", "text": "#{term}"}))
      )
  )