################## Filter Packs  ############################  
# no capital letters
thronesFilter = [ "game of thrones", "of thrones", "#got", "little finger", "song of fire and ice", "sofai", "sofi", "lannister", "stark", "baratheon", "shae", "bronn", "cersei", "tyrion", "kingslayer", "king slayer", "margaery", "robb stark", "king of the north", "stannis", "daenerys", "khaleesi", "theon", "greyjoy", "grey joy", "gray joy", "grayjoy", "tyrell", "sansa", "arya", "jon snow", "brienne", "bran", "ygritte", "renly", "joffrey", "melisandre", "lord of light", "@gameofthrones", "#asoiaf", "dragon", "gotfans", "gameofthrones", "westeros", "joffrey", "red wedding", "redwedding", "gameofthronesfilter"]

madMenFilter = [ "#madmen", "don draper", "betty draper", "january jones", "jon hamm", "john hamm", "roger sterling", "joan", "joan harris", "peggy olsen", "peggy", "pete cambpell", "ken cosgrove", "harry crane", "henry francis", "betty francis", "megan draper", "jessica par", "sally draper", "dick whitman", "#madmenspoilers", "bobby draper", "michael ginsberg", "jane sterling", "john slattery", "bert cooper", "bertram cooper", "robert morse", "trudy cambpell", "megan", "don", "sterling", "campbell", "sterling cooper", "sterling cooper draper price", "scdp", "madmenfilter" ]

arrestedDevelopmentFilter = [ "#arresteddevelopment", "bluth", "banana stand", "lucille", "gob", "george michael", "maebe", "maybe funke", "george sr", "george senior", "oscar bluth", "oscar", "buster", "baby buster", "boy fights", "tobias", "funke", "fünke", "bluth company", "mister f", "mrf", "ad2013", "mitch hurwitz", "mitch", "@mitchhurwitz", "stair car", "lucille two", "lucille 2", "lucille austero", "@arresteddev", "arrested development season 4", "magic", "illusion", "anustart", "a new start", "fake block", "fakeblock", "george maharis", "george maharris", "arresteddevelopmentfilter" ]

prettyLittleLiarsFilter = [ "@abcfpll", "pll", "pretty little liars", "#prettylittleliars", "alison", "#pllfamily", "spencer hastings", "spencer", "hanna marin", "hanna", "hannah", "emily fields", "aria", "aria montgomery", "mona", "vanderwaal", "vanderwall", "sara shepard", "marline king", "rosewood", "'a'", "prettylittleliarsfilter"]

trueBloodFilter = [ "true blood", "#trueblood", "@truebloodhbo", "trueblood", "sookie", "sookie stackhouse", "bill compton", "northman", "tara thornton", "merlotte", "stackhouse", "lafayette", "arlene", "arlene fowler", "bellefleur", "hoyt", "lettie mae", "lettie mae thornton", "rene", "bud", "bud dearborne", "dawn", "amy", "amy burley", "adele", "eddie", "bellefleur", "jessica hamby", "reverend newlin", "reverend steve", "de beaufort", "pam swynford", "russell", "alcide", "holly", "luna", "nora", "niall", "nial", "nile", "truman", "rikki", "ricky", "herveaux", "ben flynn", "nicole wright", "truebloodfilter" ]

royalBabyFilter = [ "catherine", "the queen", "queen elizabeth", "duchess of cambridge", "#royalbaby", "william", "duke of cambridge", "middleton", "carole", "buckingham palace", "highness", "throne", "duke", "duchess", "#royalbabynames", "labor", "royalbabyfilter"]

reservedWords = [ "reply", "retweet", "favorite", "expand", "more", "like", "comment", "share"]

##############################################

base = new Firebase('https://silencerio.firebaseIO.com/users')

currentUser = ->
  if localStorage['silencer']
    return JSON.parse(localStorage['silencer'])
  else
    return false

getMutes = -> currentUser().mutes

storeMutes = ->
  localStorage.setItem('silencer', JSON.stringify(currentUser()))

  id = parseInt(currentUser().id)
  userBase = base.child("/#{id}/mutes")
  userBase.set(currentUser().mutes)

Array.prototype.remove = ->
  while (arguments.length && this.length)
    what = arguments[--arguments.length]
    while ((ax = @.indexOf(what)) != -1 )
      this.splice(ax, 1)
  return this

addMute = (newMute) ->
  mutes = getMutes() # array

  for mute in mutes
    return if newMute.toLowerCase() == mute

  for word in reservedWords
    return if newMute.toLowerCase() == word

  mutes.push(newMute.toLowerCase())

  currentUser().mutes = mutes
  storeMutes()

removeMute = (muteToBeRemoved) ->
  mutes = getMutes()

  for mute in mutes
    mutes.remove(mute) if mute == muteToBeRemoved.toLowerCase()

  currentUser().mutes = mutes
  storeMutes()


chrome.runtime.onMessage.addListener( (message, sender, sendResponse) ->
  if message.term
    mixpanel.track("Content Removed From View", { id: "#{message.term}", site: "#{message.site}" })
    sendResponse({note: "term tracked"})

  if message.auth 
    chrome.tabs.create({ url: "http://silencer.io/auth" })

  if message.userInfo
    localStorage.setItem('silencer', "#{message.user}")

  if message.checkingForUser
    sendResponse(currentUser())
)

if currentUser()
  id = parseInt(currentUser().id)

  userBase = base.child("/#{id}")
  userBase.set(currentUser())
