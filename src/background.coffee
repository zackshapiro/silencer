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

addMutePack = (name) ->
  addGoTFilter() if name == "got"
  addMmFilter() if name == "mm"
  addAdFilter() if name == "ad"
  addPllFilter() if name == "pll"
  addTbFilter() if name == "tb"
  addRoyalBabyFilter() if name == "rb"

  addMute("instagram.com") if name == "instagram"
  addMute("getglue") if name == "glue"
  addMute("ask.fm") if name == "ask"
  addMute("vine.co") if name == "vine"
  addMute("4sq.com") if name == "4sq"
  addMute("path.com") if name == "path"
  addMute("t.imehop.com") if name == "timehop"
  addMute("medium.com") if name == "medium"
  addMute("go.nike.com") if name == "nike"
  addMute("cir.ca") if name == "circa"
  addMute("paper.li") if name == "paper"

removeMutePack = (name) ->
  removeGoTFilter() if name == "got"
  removeMmFilter() if name == "mm"
  removeAdFilter() if name == "ad"
  removePllFilter() if name == "pll"
  removeTbFilter() if name == "tb"
  removeRoyalBabyFilter() if name == "rb"

  removeMute("instagram.com") if name == "instagram"
  removeMute("getglue") if name == "glue"
  removeMute("ask.fm") if name == "ask"
  removeMute("vine.co") if name == "vine"
  removeMute("4sq.com") if name == "4sq"
  removeMute("path.com") if name == "path"
  removeMute("t.imehop.com") if name == "timehop"
  removeMute("medium.com") if name == "medium"
  removeMute("go.nike.com") if name == "nike"
  removeMute("cir.ca") if name == "circa"
  removeMute("paper.li") if name == "paper"


addGoTFilter = -> addMute(item) for item in thronesFilter
removeGoTFilter = -> removeMute(item) for item in thronesFilter

addMmFilter = -> addMute(item) for item in madMenFilter
removeMmFilter = -> removeMute(item) for item in madMenFilter

addAdFilter = -> addMute(item) for item in arrestedDevelopmentFilter
removeAdFilter = -> removeMute(item) for item in arrestedDevelopmentFilter

addPllFilter = -> addMute(item) for item in prettyLittleLiarsFilter
removePllFilter = -> removeMute(item) for item in prettyLittleLiarsFilter

addTbFilter = -> addMute(item) for item in trueBloodFilter
removeTbFilter = -> removeMute(item) for item in trueBloodFilter

addRoyalBabyFilter = -> addMute(item) for item in royalBabyFilter
removeRoyalBabyFilter = -> removeMute(item) for item in royalBabyFilter


base = new Firebase('https://silencerio.firebaseIO.com/users')

currentUser = ->
  if localStorage['silencer']
    return JSON.parse(localStorage['silencer'])
  else
    return false

getMutes = -> currentUser().mutes

storeMutes = (user) ->
  localStorage.setItem('silencer', JSON.stringify(user))

  id = parseInt(user.id)
  userBase = base.child("/#{id}/mutes")
  userBase.set(user.mutes)

Array.prototype.remove = ->
  while (arguments.length && this.length)
    what = arguments[--arguments.length]
    while ((ax = @.indexOf(what)) != -1 )
      this.splice(ax, 1)
  return this

addMute = (newMute) ->
  user = currentUser()
  mutes = getMutes()

  for mute in mutes
    return if newMute == mute

  for word in reservedWords
    return if newMute == word

  mutes.push(newMute)
  mixpanel.track('Term Added', {id: newMute})

  user.mutes = mutes
  storeMutes(user)

removeMute = (muteToBeRemoved) ->
  user = currentUser()
  mutes = getMutes()

  for mute in mutes
    mutes.remove(mute) if mute == muteToBeRemoved

  mixpanel.track("Term Removed", {id: muteToBeRemoved})
  user.mutes = mutes
  storeMutes(user)


chrome.runtime.onMessage.addListener( (message, sender, sendResponse) ->
  if message.termSlidUp
    mixpanel.track("Content Removed From View", { id: "#{message.termSlidUp}", site: "#{message.site}" })

  if message.auth 
    chrome.tabs.create({ url: "http://silencer.io/auth" })

  if message.userInfo
    localStorage.setItem('silencer', "#{message.user}")

  if message.checkingForUser || message.mutesRequest
    sendResponse(currentUser())

  if message.contentScriptMutesRequest
    chrome.tabs.query("active": true, "currentWindow": true,
    (tab) ->
      chrome.tabs.sendMessage(tab[0].id, terms: currentUser().mutes)
    )

  if message.addMute
    addMute(message.term)

  if message.removeMute
    removeMute(message.term)

  if message.mutePackAdd
    addMutePack(message.mutePackName)

  if message.mutePackRemove
    removeMutePack(message.mutePackName)
)

if currentUser() # only fires once. do i need this?
  id = parseInt(currentUser().id)

  userBase = base.child("/#{id}")
  userBase.set(currentUser())
