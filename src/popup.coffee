$ ->

  # Init here

  # focuses on the input box after user presses enter
  $('.term-to-submit').focus()

  $(".log-in").click (e) ->
    e.preventDefault()
    chrome.runtime.sendMessage({auth: true})

  chrome.runtime.sendMessage({checkingForUser: true}, (response) ->
    $(".log-in").hide() unless response == false
  )

  newTerm = -> $('.term-to-submit').val()

  setMuteValue = (terms) ->
    for term in terms
      $(".add-got").text("Unmute") if term == "gameofthronesfilter"
      $(".add-mm").text("Unmute") if term == "madmenfilter"
      $(".add-ad").text("Unmute") if term == "arresteddevelopmentfilter"
      $(".add-pll").text("Unmute") if term == "prettylittleliarsfilter"
      $(".add-tb").text("Unmute") if term == "truebloodfilter"
      $(".add-rb").text("Unmute") if term == "royalbabyfilter"
      $(".add-bb").text("Unmute") if term == "breakingbadfilter"
      $(".add-ointb").text("Unmute") if term == "orangenewblackfilter"
      $(".add-dex").text("Unmute") if term == "dexterfilter"
      $(".add-newsroom").text("Unmute") if term == "newsroomfilter"

      $(".add-ig").text("Unmute") if term == "instagram.com"
      $(".add-glue").text("Unmute") if term == "getglue"
      $(".add-ask").text("Unmute") if term == "ask.fm"
      $(".add-vine").text("Unmute") if term == "vine.co"
      $(".add-4sq").text("Unmute") if term == "4sq.com"
      $(".add-path").text("Unmute") if term == "path.com"
      $(".add-th").text("Unmute") if term == "t.imehop.com"
      $(".add-medium").text("Unmute") if term == "medium.com"
      $(".add-nike").text("Unmute") if term == "go.nike.com"
      $(".add-circa").text("Unmute") if term == "cir.ca"
      $(".add-paper").text("Unmute") if term == "paper.li"

      # don't forget to add filter triggers below

  handleCategory = (event, selector, message, filterName) ->
    event.preventDefault()
    if $(selector).text() == "Mute"
      mixpanel.track("#{message} Added")
      chrome.runtime.sendMessage({mutePackAdd: true, mutePackName: filterName})

      $(selector).text("Unmute")
    else
      mixpanel.track("#{message} Removed")
      chrome.runtime.sendMessage({mutePackRemove: true, mutePackName: filterName})

      $(selector).text("Mute")


  $('.pack-expander').click (e) ->
    e.preventDefault()
    if $('.filter-packs').is(":visible")
      $('.filter-packs').slideUp()
    else
      $('.filter-packs').slideDown()


  # Add term (enter pressed)
  $('.my-form').submit ->
    newTerm = newTerm().toLowerCase()

    unless newTerm == ""
      chrome.runtime.sendMessage({addMute: true, term: newTerm})
      $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm}", "text": "#{newTerm}"}))

  # Add term (button clicked)
  $('.mute.submit').click ->
    $('.term-to-submit').focus()
    newTerm = newTerm().toLowerCase()

    unless newTerm == ""
      chrome.runtime.sendMessage({addMute: true, term: newTerm})
      $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm}", "text": "#{newTerm}"}))


  # Show terms
  chrome.tabs.query(active: true, currentWindow: true,
  (tab) -> 
    chrome.runtime.sendMessage({mutesRequest: true}, (response) ->
      if response.mutes
        setMuteValue(response.mutes)

        for term in response.mutes
          $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{term}", "text": "#{term}"} ))

        for child in $(".terms").children()
          $(child).wrapInner("<a href='#' class='remove-term'></a>")

      mixpanel.track('Silencer Opened')
    )
  )


  # Remove term
  $(".terms").on('click', 'li a', ( (e) => 
    e.preventDefault()
    term = $(e.currentTarget).parent().data("term")
    $(e.currentTarget).parent().slideUp()
    
    chrome.runtime.sendMessage({removeMute: true, term: term})
  ))


  ### Adding filters ### 

  $('.add-got').click (e) -> handleCategory(e, '.add-got', "GoT Filter", "got")
  $('.add-mm').click (e) -> handleCategory(e, '.add-mm', "Mad Men Filter", "mm")
  $('.add-ad').click (e) -> handleCategory(e, '.add-ad', "Arrested Development Filter", "ad")
  $('.add-pll').click (e) -> handleCategory(e, '.add-pll', "Prety Little Liars Filter", "pll")
  $('.add-tb').click (e) -> handleCategory(e, '.add-tb', "True Blood Filter", "tb")
  $('.add-rb').click (e) -> handleCategory(e, '.add-rb', "Royal Baby Filter", "rb")
  $('.add-bb').click (e) -> handleCategory(e, '.add-bb', "Breaking Bad Filter", "bb")
  $('.add-ointb').click (e) -> handleCategory(e, '.add-ointb', "Orange is the New Black Filter", "ointb")
  $('.add-dex').click (e) -> handleCategory(e, '.add-dex', "Dexter Filter", "dexter")
  $('.add-newsroom').click (e) -> handleCategory(e, '.add-newsroom', "The Newsroom Filter", "newsroom")

  $('.add-ig').click (e) -> handleCategory(e, '.add-ig', "Instagram Mute", "instagram")
  $('.add-ask').click (e) -> handleCategory(e, '.add-ask', "Ask.fm Mute", "ask")
  $('.add-glue').click (e) -> handleCategory(e, '.add-glue', "GetGlue Mute", "glue")
  $('.add-vine').click (e) -> handleCategory(e, '.add-vine', "Vine Mute", "vine")
  $('.add-4sq').click (e) -> handleCategory(e, '.add-4sq', "Foursquare Mute", "4sq")
  $('.add-path').click (e) -> handleCategory(e, '.add-path', "Path Mute", "path")
  $('.add-th').click (e) -> handleCategory(e, '.add-th', "Timehop Mute", "timehop")
  $('.add-medium').click (e) -> handleCategory(e, '.add-medium', "Medium Mute", "medium")
  $('.add-nike').click (e) -> handleCategory(e, '.add-nike', "Nike+ Mute", "nike")
  $('.add-circa').click (e) -> handleCategory(e, '.add-circa', "Circa Mute", "circa")
  $('.add-paper').click (e) -> handleCategory(e, '.add-paper', "Paper.li Mute", "paper")