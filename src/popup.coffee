$ ->

  $(".twitter-login-button").click (e) ->
    e.preventDefault()
    chrome.runtime.sendMessage({auth: true})

  newTerm = -> $('.term-to-submit').val()

  setMuteValue = (terms) ->
    for term in terms
      $(".add-got").text("Unmute") if term == "gameofthronesfilter"
      $(".add-mm").text("Unmute") if term == "madmenfilter"
      $(".add-ad").text("Unmute") if term == "arresteddevelopmentfilter"
      $(".add-pll").text("Unmute") if term == "prettylittleliarsfilter"
      $(".add-tb").text("Unmute") if term == "truebloodfilter"
      $(".add-ig").text("Unmute") if term == "instagram.com"
      $(".add-vine").text("Unmute") if term == "vine.co"
      $(".add-4sq").text("Unmute") if term == "4sq.com"
      $(".add-path").text("Unmute") if term == "path.com"
      $(".add-th").text("Unmute") if term == "t.imehop.com"
      $(".add-medium").text("Unmute") if term == "medium.com"
      $(".add-nike").text("Unmute") if term == "go.nike.com"
      $(".add-circa").text("Unmute") if term == "cir.ca"
      $(".add-paper").text("Unmute") if term == "paper.li"

  handleCategory = (event, selector, message, filterName) ->
    event.preventDefault()
    if $(selector).text() == "Mute"
      mixpanel.track("#{message} Added")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filter#{filterName}-add")
      )
      $(selector).text("Unmute")
    else
      mixpanel.track("Instagram Mute Removed")
      chrome.tabs.query("active": true, "currentWindow": true, 
        (tab) ->
          chrome.tabs.sendMessage(tab[0].id, "filter#{filterName}-remove")
      )
      $(selector).text("Mute")

  $('.pack-expander').click (e) ->
    e.preventDefault()
    if $('.filter-packs').is(":visible")
      $('.filter-packs').slideUp()
    else
      $('.filter-packs').slideDown()

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

          setMuteValue(terms)

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
    handleCategory(e, '.add-got', "GoT Filter", "got")

  $('.add-mm').click (e) ->
    handleCategory(e, '.add-mm', "Mad Men Filter", "mm")

  $('.add-ad').click (e) ->
    handleCategory(e, '.add-ad', "Arrested Development Filter", "ad")

  $('.add-pll').click (e) ->
    handleCategory(e, '.add-pll', "Prety Little Liars Filter", "pll")

  $('.add-tb').click (e) ->
    handleCategory(e, '.add-tb', "True Blood Filter", "tb")


  $('.add-ig').click (e) ->
    handleCategory(e, '.add-ig', "Instagram Mute", "instagram")

  $('.add-vine').click (e) ->
    handleCategory(e, '.add-vine', "Vine Mute", "vine")

  $('.add-4sq').click (e) ->
    handleCategory(e, '.add-4sq', "Foursquare Mute", "4sq")

  $('.add-path').click (e) ->
    handleCategory(e, '.add-path', "Path Mute", "path")

  $('.add-th').click (e) ->
    handleCategory(e, '.add-th', "Timehop Mute", "timehop")

  $('.add-medium').click (e) ->
    handleCategory(e, '.add-medium', "Medium Mute", "medium")

  $('.add-nike').click (e) ->
    handleCategory(e, '.add-nike', "Nike+ Mute", "nike")

  $('.add-circa').click (e) ->
    handleCategory(e, '.add-circa', "Circa Mute", "circa")

  $('.add-paper').click (e) ->
    handleCategory(e, '.add-paper', "Paper.li Mute", "paper")