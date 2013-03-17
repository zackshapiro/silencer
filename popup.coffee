$ ->

  # or should this be the button click action?
  if $('.my-form').submit && $('.term-to-submit').val() != ""
    newTerm = $('.term-to-submit').val()
    chrome.tabs.query("active": true, "currentWindow": true,
      (tab) ->
        chrome.tabs.sendMessage(tab[0].id, newTerm,
          (response) ->
            console.log response
        )
    )
  else
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