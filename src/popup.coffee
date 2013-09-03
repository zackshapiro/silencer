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

  setMuteValue = (terms) ->
    for term in terms
      $(".add-got").text("Unmute") if term == "gameofthronesfilter"
      $(".add-mm").text("Unmute") if term == "madmenfilter"
      $(".add-ad").text("Unmute") if term == "arresteddevelopmentfilter"
      $(".add-pll").text("Unmute") if term == "prettylittleliarsfilter"
      $(".add-tb").text("Unmute") if term == "truebloodfilter"
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


      #TODO Do for all NFL here, AFC, NFC
      $(".add-nfl").text("Unmute") if term == "nflfilter"
      $(".add-afc").text("Unmute") if term == "afcfilter"
      $(".add-nfc").text("Unmute") if term == "nfcfilter"

      # AFC
      $(".add-bal").text("Unmute") if term == "ravensfilter"
      $(".add-cin").text("Unmute") if term == "bengalsfilter"
      $(".add-cle").text("Unmute") if term == "brownsfilter"
      $(".add-pit").text("Unmute") if term == "steelersfilter"
      $(".add-hou").text("Unmute") if term == "texansfilter"
      $(".add-ind").text("Unmute") if term == "coltsfilter"
      $(".add-jax").text("Unmute") if term == "jaguarsfilter"
      $(".add-ten").text("Unmute") if term == "titansfilter"
      $(".add-buf").text("Unmute") if term == "billsfilter"
      $(".add-mia").text("Unmute") if term == "dolphinsfilter"
      $(".add-ne").text("Unmute") if term == "patriotsfilter"
      $(".add-nyj").text("Unmute") if term == "jetsfilter"
      $(".add-den").text("Unmute") if term == "broncosfilter"
      $(".add-kc").text("Unmute") if term == "chiefsfilter"
      $(".add-oak").text("Unmute") if term == "raidersfilter"
      $(".add-sd").text("Unmute") if term == "chargersfilter"

      # NFC
      $(".add-chi").text("Unmute") if term == "bearsfilter"
      $(".add-det").text("Unmute") if term == "lionsfilter"
      $(".add-gb").text("Unmute") if term == "packersfilter"
      $(".add-min").text("Unmute") if term == "vikingsfilter"
      $(".add-atl").text("Unmute") if term == "falconsfilter"
      $(".add-car").text("Unmute") if term == "panthersfilter"
      $(".add-no").text("Unmute") if term == "saintsfilter"
      $(".add-bucs").text("Unmute") if term == "buccaneersfilter"
      $(".add-dal").text("Unmute") if term == "cowboysfilter"
      $(".add-nyg").text("Unmute") if term == "giantsfilter"
      $(".add-phi").text("Unmute") if term == "eaglesfilter"
      $(".add-wsh").text("Unmute") if term == "redskinsfilter"
      $(".add-ari").text("Unmute") if term == "cardinalsfilter"
      $(".add-sf").text("Unmute") if term == "fortyninersfilter"
      $(".add-sea").text("Unmute") if term == "seahawksfilter"
      $(".add-stl").text("Unmute") if term == "ramsfilter"


      # don't forget to add filter triggers below

  handleCategory = (event, selector, message, filterName) ->
    event.preventDefault()

    if $(selector).text() == "Mute"
      if filterName == "afc" || filterName == "nfc"
        teams = $(selector).parent().parent().children().find('.cta')
        $(selector).text("Unmute")
        $(team).text("Unmute") for team in teams

        mixpanel.track("#{message} Added")
        chrome.runtime.sendMessage({mutePackAdd: true, mutePackName: filterName})
      else if filterName == "nfl"
        $('.add-afc').click() unless $('.add-afc').text() == "Unmute"
        $('.add-nfc').click() unless $('.add-nfc').text() == "Unmute"
        $(selector).text("Unmute")
        mixpanel.track("#{message} Added")
      else
        mixpanel.track("#{message} Added")
        chrome.runtime.sendMessage({mutePackAdd: true, mutePackName: filterName})
        $(selector).text("Unmute")
    else
      if filterName == "afc" || filterName == "nfc"
        teams = $(selector).parent().parent().children().find('.cta')
        $(selector).text("Mute")
        $(team).text("Mute") for team in teams

        mixpanel.track("#{message} Removed")
        chrome.runtime.sendMessage({mutePackRemove: true, mutePackName: filterName})
      else if filterName == "nfl"
        $('.add-afc').click() unless $('.add-afc').text() == "Mute"
        $('.add-nfc').click() unless $('.add-nfc').text() == "Mute"
        $(selector).text("Mute")
        mixpanel.track("#{message} Added")
      else
        mixpanel.track("#{message} Removed")
        chrome.runtime.sendMessage({mutePackRemove: true, mutePackName: filterName})
        $(selector).text("Mute")


  $('.pack-expander').click (e) ->
    e.preventDefault()
    if $('.filter-packs').css('display') != 'none' then $('.filter-packs').slideUp() else $('.filter-packs').slideDown()


  # Add term (enter pressed)
  $('.my-form').submit ->
    newTerm = $('.term-to-submit').val().toLowerCase()

    unless newTerm == ""
      chrome.runtime.sendMessage({addMute: true, term: newTerm})
      $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm}", "text": "#{newTerm}"}))

  # Add term (button clicked)
  $('.mute.submit').click ->
    $('.term-to-submit').focus()
    newTerm = $('.term-to-submit').val().toLowerCase()

    unless newTerm == ""
      chrome.runtime.sendMessage({addMute: true, term: newTerm})
      $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{newTerm}", "text": "#{newTerm}"}))

    $('.term-to-submit').val("")

  # Show terms
  chrome.tabs.query(active: true, currentWindow: true,
  (tab) -> 
    chrome.runtime.sendMessage({mutesRequest: true}, (response) ->
      if response.mutes
        setMuteValue(response.mutes)

        for term in response.mutes
          $(".terms").append($('<li></li>', {"class": "term", "data-term": "#{term}", "text": "#{term}"} ))

        for child in $(".terms").children()
          $(child).append($('<div></div>', {"class": 'removal', "text": '+'} ))
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
  # TV shows
  $('.add-got').click (e) -> handleCategory(e, '.add-got', "GoT Filter", "got")
  $('.add-mm').click (e) -> handleCategory(e, '.add-mm', "Mad Men Filter", "mm")
  $('.add-ad').click (e) -> handleCategory(e, '.add-ad', "Arrested Development Filter", "ad")
  $('.add-pll').click (e) -> handleCategory(e, '.add-pll', "Prety Little Liars Filter", "pll")
  $('.add-tb').click (e) -> handleCategory(e, '.add-tb', "True Blood Filter", "tb")
  $('.add-bb').click (e) -> handleCategory(e, '.add-bb', "Breaking Bad Filter", "bb")
  $('.add-ointb').click (e) -> handleCategory(e, '.add-ointb', "Orange is the New Black Filter", "ointb")
  $('.add-dex').click (e) -> handleCategory(e, '.add-dex', "Dexter Filter", "dexter")
  $('.add-newsroom').click (e) -> handleCategory(e, '.add-newsroom', "The Newsroom Filter", "newsroom")

  # Services
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

  # NFL
  $(".add-nfl").click (e) -> handleCategory(e, ".add-nfl", "NFL Filter", "nfl")
  $(".add-afc").click (e) -> handleCategory(e, ".add-afc", "NFL Filter", "afc")
  $(".add-nfc").click (e) -> handleCategory(e, ".add-nfc", "NFL Filter", "nfc")
  # AFC
  $(".add-bal").click (e) -> handleCategory(e, ".add-bal", "Ravens Filter", "bal")
  $(".add-cin").click (e) -> handleCategory(e, ".add-cin", "Bengals Filter", "cin")
  $(".add-cle").click (e) -> handleCategory(e, ".add-cle", "Browns Filter", "cle")
  $(".add-pit").click (e) -> handleCategory(e, ".add-pit", "Steelers Filter", "pit")
  $(".add-hou").click (e) -> handleCategory(e, ".add-hou", "Texans Filter", "hou")
  $(".add-ind").click (e) -> handleCategory(e, ".add-ind", "Colts Filter", "ind")
  $(".add-jax").click (e) -> handleCategory(e, ".add-jax", "Jaguars Filter", "jax")
  $(".add-ten").click (e) -> handleCategory(e, ".add-ten", "Titans Filter", "ten")
  $(".add-buf").click (e) -> handleCategory(e, ".add-buf", "Bills Filter", "buf")
  $(".add-mia").click (e) -> handleCategory(e, ".add-mia", "Dolphins Filter", "mia")
  $(".add-ne").click (e) -> handleCategory(e, ".add-ne", "Patriots Filter", "ne")
  $(".add-nyj").click (e) -> handleCategory(e, ".add-nyj", "Jets Filter", "nyj")
  $(".add-den").click (e) -> handleCategory(e, ".add-den", "Broncos Filter", "den")
  $(".add-kc").click (e) -> handleCategory(e, ".add-kc", "Chiefs Filter", "kc")
  $(".add-oak").click (e) -> handleCategory(e, ".add-oak", "Raiders Filter", "oak")
  $(".add-sd").click (e) -> handleCategory(e, ".add-sd", "Chargers Filter", "sd")

  # NFC
  $(".add-chi").click (e) -> handleCategory(e, ".add-chi", "Bears Filter", "chi")
  $(".add-det").click (e) -> handleCategory(e, ".add-det", "Lions Filter", "det")
  $(".add-gb").click (e) -> handleCategory(e, ".add-gb", "Packers Filter", "gb")
  $(".add-min").click (e) -> handleCategory(e, ".add-min", "Vikings Filter", "min")
  $(".add-atl").click (e) -> handleCategory(e, ".add-atl", "Falcons Filter", "atl")
  $(".add-car").click (e) -> handleCategory(e, ".add-car", "Panthers Filter", "car")
  $(".add-no").click (e) -> handleCategory(e, ".add-no", "Saints Filter", "no")
  $(".add-bucs").click (e) -> handleCategory(e, ".add-bucs", "Buccaneers Filter", "bucs")
  $(".add-dal").click (e) -> handleCategory(e, ".add-dal", "Cowboys Filter", "dal")
  $(".add-nyg").click (e) -> handleCategory(e, ".add-nyg", "Giants Filter", "nyg")
  $(".add-phi").click (e) -> handleCategory(e, ".add-phi", "Eagles Filter", "phi")
  $(".add-wsh").click (e) -> handleCategory(e, ".add-wsh", "Redskins Filter", "wsh")
  $(".add-ari").click (e) -> handleCategory(e, ".add-ari", "Cardinals Filter", "ari")
  $(".add-sf").click (e) -> handleCategory(e, ".add-sf", "49ers Filter", "sf")
  $(".add-sea").click (e) -> handleCategory(e, ".add-sea", "Seahawks Filter", "sea")
  $(".add-stl").click (e) -> handleCategory(e, ".add-stl", "Rams Filter", "stl")
