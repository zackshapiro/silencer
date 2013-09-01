################## Filter Packs  ############################  
# no capital letters
thronesFilter = [ "game of thrones", "of thrones", "#got", "little finger", "song of fire and ice", "sofai", "sofi", "lannister", "stark", "baratheon", "shae", "bronn", "cersei", "tyrion", "kingslayer", "king slayer", "margaery", "robb stark", "king of the north", "stannis", "daenerys", "khaleesi", "theon", "greyjoy", "grey joy", "gray joy", "grayjoy", "tyrell", "sansa", "arya", "jon snow", "brienne", "bran", "ygritte", "renly", "joffrey", "melisandre", "lord of light", "@gameofthrones", "#asoiaf", "dragon", "gotfans", "gameofthrones", "westeros", "joffrey", "red wedding", "redwedding", "gameofthronesfilter"]

madMenFilter = [ "#madmen", "don draper", "betty draper", "january jones", "jon hamm", "john hamm", "roger sterling", "joan", "joan harris", "peggy olsen", "peggy", "pete cambpell", "ken cosgrove", "harry crane", "henry francis", "betty francis", "megan draper", "jessica par", "sally draper", "dick whitman", "#madmenspoilers", "bobby draper", "michael ginsberg", "jane sterling", "john slattery", "bert cooper", "bertram cooper", "robert morse", "trudy cambpell", "megan", "don", "sterling", "campbell", "sterling cooper", "sterling cooper draper price", "scdp", "madmenfilter" ]

arrestedDevelopmentFilter = [ "#arresteddevelopment", "bluth", "banana stand", "lucille", "gob", "george michael", "maebe", "maybe funke", "george sr", "george senior", "oscar bluth", "oscar", "buster", "baby buster", "boy fights", "tobias", "funke", "fünke", "bluth company", "mister f", "mrf", "ad2013", "mitch hurwitz", "mitch", "@mitchhurwitz", "stair car", "lucille two", "lucille 2", "lucille austero", "@arresteddev", "arrested development season 4", "magic", "illusion", "anustart", "a new start", "fake block", "fakeblock", "george maharis", "george maharris", "arresteddevelopmentfilter" ]

prettyLittleLiarsFilter = [ "@abcfpll", "pll", "pretty little liars", "#prettylittleliars", "alison", "#pllfamily", "spencer hastings", "spencer", "hanna marin", "hanna", "hannah", "emily fields", "aria", "aria montgomery", "mona", "vanderwaal", "vanderwall", "sara shepard", "marline king", "rosewood", "'a'", "prettylittleliarsfilter"]

trueBloodFilter = [ "true blood", "#trueblood", "@truebloodhbo", "trueblood", "sookie", "sookie stackhouse", "bill compton", "northman", "tara thornton", "merlotte", "stackhouse", "lafayette", "arlene", "arlene fowler", "bellefleur", "hoyt", "lettie mae", "lettie mae thornton", "rene", "bud", "bud dearborne", "dawn", "amy", "amy burley", "adele", "eddie", "bellefleur", "jessica hamby", "reverend newlin", "reverend steve", "de beaufort", "pam swynford", "russell", "alcide", "holly", "luna", "nora", "niall", "nial", "nile", "truman", "rikki", "ricky", "herveaux", "ben flynn", "nicole wright", "truebloodfilter" ]

royalBabyFilter = [ "catherine", "the queen", "queen elizabeth", "duchess of cambridge", "#royalbaby", "william", "duke of cambridge", "middleton", "carole", "buckingham palace", "highness", "throne", "duke", "duchess", "#royalbabynames", "labor", "royalbabyfilter"]

breakingBadFilter = ["breaking bad", "walt", "walter white", "hank", "walter", "#breakingbad", "breakfast", "skyler", "beneke", "jesse", "pinkman", "gus fring", "fring", "@breakingbad_amc", "@rjmitte", "#bb", "#brba", "meth", "gilligan", "holly", "schrader", "gomez", "cook", "todd", "grey matter", "cancer", "scarface", "chips", "tuco", "salamanca", "meth lab", "super lab", "ricin", "declan", "mike", "ehrmentraut", "cranston", "gunn", "aaron paul", "mitte", "dean norris", "aaron paul", "@bryancranston", "@aaronpaul_8", "saul", "odenkirk", "jonathan banks", "marie", "walter jr", "junior", "lydia", "schwartz", "lambert", "skinny pete", "badger", "breakingbadfilter"]

orangeNewBlackFilter = ["orange is the new black", "#ointb", "@ointb", "claudette", "sam healy", "sam healey", "larry", "nicky", "sophia", "piper", "tasty", "taystee", "pornstache", "@lavernecox", "susan", "joel", "wanda", "@piper", "daya", "crazy eyes", "aleida", "orangenewblackfilter"]

dexterFilter = [ "dexter", "#dexter", "@sho_dexter", "dexter morgan", "harrison", "astor", "cody", "hannah", "hanna", "rita", "maria", "angel", "harry", "vince", "kill room", "miami", "the code", "code of harry", "dark passenger", "bay harbor", "ice truck", "trinity", "moser", "bennett", "jacob", "elway", "evelyn", "vogel", "doomsday", "james daokes", "sargeant doakes", "sgt doakes", "miami metro", "santa muerte murders", "barrel girls", "dexterfilter" ]

newsroomFilter = [ "the newsroom", "acn", "willmcavoyacn", "will", "mcavoy", "#thenewsroom", "#newsroom", "sloan", "@jeff_daniels", "@iamdrunksam", "charlie", "skinner", "neal", "@nealsampatacn", "mackmchaleacn", "mack", "jim", "jim harper", "maggie", "news night", "don keefer", "awm", "atlantis", "aaron sorkin", "oliva munn", "jonas", "leona", "reese", "kendra", "elliot", "nina", "tess", "gary", "martin", "tamara", "wade", "lonny", "lonnie", "hallie", "rebecca", "newsroomfilter" ]

reservedWords = [ "reply", "retweet", "favorite", "expand", "more", "like", "comment", "share"]

ravensFilter = []
bengalsFilter = []
brownsFilter = []
steelersFilter = []
texansFilter = []
coltsFilter = []
jaguarsFilter = []
titansFilter = []
billsFilter = []
dolphinsFilter = []
patriotsFilter = []
jetsFilter = []
broncosFilter = []
chiefsFilter = []
raidersFilter = []
chargersFilter = []

bearsFilter = []
lionsFilter = []
packersFilter = []
vikingsFilter = []
falconsFilter = []
panthersFilter = []
saintsFilter = []
buccaneersFilter = []
cowboysFilter = []
giantsFilter = []
eaglesFilter = []
redskinsFilter = []
cardinalsFilter = []
fortyNinersFilter = []
seahawksFilter = []
ramsFilter = []

##############################################

addMutePack = (name) ->
  addGoTFilter() if name == "got"
  addMmFilter() if name == "mm"
  addAdFilter() if name == "ad"
  addPllFilter() if name == "pll"
  addTbFilter() if name == "tb"
  addRoyalBabyFilter() if name == "rb"
  addBreakingBadFilter() if name == "bb"
  addOintbFilter() if name == "ointb"
  addDexterFilter() if name == "dexter"
  addNewsroomFilter() if name == "newsroom"

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

  addRavensFilter() if name == "bal"
  addBengalsFilter() if name == "cin"
  addBrownsFilter() if name == "cle"
  addSteelersFilter() if name == "pit"
  addTexansFilter() if name == "hou"
  addColtsFilter() if name == "ind"
  addJaguarsFilter() if name == "jax"
  addTitansFilter() if name == "ten"
  addBillsFilter() if name == "buf"
  addDolphinsFilter() if name == "mia"
  addPatriotsFilter() if name == "ne"
  addJetsFilter() if name == "nyj"
  addBroncosFilter() if name == "den"
  addChiefsFilter() if name == "kc"
  addRaidersFilter() if name == "oak"
  addChargerFilter() if name == "sd"

  addBearsFilter() if name == "chi"
  addLionsFilter() if name == "det"
  addPackersFilter() if name == "gb"
  addVikingsFilter() if name == "min"
  addFalconsFilter() if name == "atl"
  addPanthersFilter() if name == "car"
  addSaintsFilter() if name == "no"
  addBucaneersFilter() if name == "bucs"
  addCowboysFilter() if name == "dal"
  addGiantsFilter() if name == "nyg"
  addEaglesFilter() if name == "phi"
  addRedskinsFilter() if name == "wsh"
  addCardinalsFilter() if name == "ari"
  addFortyNinersFilter() if name == "sf"
  addSeahawksFilter() if name == "sea"
  addRamsFilter() if name == "stl"

removeMutePack = (name) ->
  removeGoTFilter() if name == "got"
  removeMmFilter() if name == "mm"
  removeAdFilter() if name == "ad"
  removePllFilter() if name == "pll"
  removeTbFilter() if name == "tb"
  removeRoyalBabyFilter() if name == "rb"
  removeBreakingBadFilter() if name == "bb"
  removeOintbFilter() if name == "ointb"
  removeDexterFilter() if name == "dexter"
  removeNewsroomFilter() if name == "newsroom"

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

  removeRavensFilter() if name == "bal"
  removeBengalsFilter() if name == "cin"
  removeBrownsFilter() if name == "cle"
  removeSteelersFilter() if name == "pit"
  removeTexansFilter() if name == "hou"
  removeColtsFilter() if name == "ind"
  removeJaguarsFilter() if name == "jax"
  removeTitansFilter() if name == "ten"
  removeBillsFilter() if name == "buf"
  removeDolphinsFilter() if name == "mia"
  removePatriotsFilter() if name == "ne"
  removeJetsFilter() if name == "nyj"
  removeBroncosFilter() if name == "den"
  removeChiefsFilter() if name == "kc"
  removeRaidersFilter() if name == "oak"
  removeChargerFilter() if name == "sd"

  removeBearsFilter() if name == "chi"
  removeLionsFilter() if name == "det"
  removePackersFilter() if name == "gb"
  removeVikingsFilter() if name == "min"
  removeFalconsFilter() if name == "atl"
  removePanthersFilter() if name == "car"
  removeSaintsFilter() if name == "no"
  removeBuccaneersFilter() if name == "bucs"
  removeCowboysFilter() if name == "dal"
  removeGiantsFilter() if name == "nyg"
  removeEaglesFilter() if name == "phi"
  removeRedskinsFilter() if name == "wsh"
  removeCardinalsFilter() if name == "ari"
  removeFortyNinersFilter() if name == "sf"
  removeSeahawksFilter() if name == "sea"
  removeRamsFilter() if name == "stl"


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

addBreakingBadFilter = -> addMute(item) for item in breakingBadFilter
removeBreakingBadFilter = -> removeMute(item) for item in breakingBadFilter

addOintbFilter = -> addMute(item) for item in orangeNewBlackFilter
removeOintbFilter = -> removeMute(item) for item in orangeNewBlackFilter

addDexterFilter = -> addMute(item) for item in dexterFilter
removeDexterFilter = -> removeMute(item) for item in dexterFilter

addNewsroomFilter = -> addMute(item) for item in newsroomFilter
removeNewsroomFilter = -> removeMute(item) for item in newsroomFilter

# NFL
addRavensFilter = -> addMute(item) for item in ravensFilter
removeRavensFilter = -> removeMute(item) for item in ravensFilter

addBengalsFilter = -> addMute(item) for item in bengalsFilter
removeBengalsFilter = -> removeMute(item) for item in bengalsFilter

addBrownsFilter = -> addMute(item) for item in brownsFilter
addBrownsFilter = -> removeMute(item) for item in brownsFilter

addSteelersFilter = -> addMute(item) for item in steelersFilter
removeSteelersFilter = -> removeMute(item) for item in steelersFilter

addTexansFilter = -> addMute(item) for item in texansFilter
removeTexansFilter = -> removeMute(item) for item in texansFilter

addColtsFilter = -> addMute(item) for item in coltsFilter
removeColtsFilter = -> removeMute(item) for item in coltsFilter

addJaguarsFilter = -> addMute(item) for item in jaguarsFilter
removeJaguarsFilter = -> removeMute(item) for item in jaguarsFilter

addTitansFilter = -> addMute(item) for item in titansFilter
removeTitansFilter = -> removeMute(item) for item in titansFilter

addBillsFilter = -> addMute(item) for item in billsFilter
removeBillsFilter = -> removeMute(item) for item in billsFilter

addDolphinsFilter = -> addMute(item) for item in dolphinsFilter
removeDolphinsFilter = -> removeMute(item) for item in dolphinsFilter

addPatriotsFilter = -> addMute(item) for item in patriotsFilter
removePatriotsFilter = -> removeMute(item) for item in patriotsFilter

addJetsFilter = -> addMute(item) for item in jetsFilter
removeJetsFilter = -> removeMute(item) for item in jetsFilter

addBroncosFilter = -> addMute(item) for item in broncosFilter
removeBroncosFilter = -> removeMute(item) for item in broncosFilter

addChiefsFilter = -> addMute(item) for item in chiefsFilter
removeChiefsFilter = -> removeMute(item) for item in chiefsFilter

addRaidersFilter = -> addMute(item) for item in raidersFilter
removeRaidersFilter = -> removeMute(item) for item in raidersFilter

addChargersFilter = -> addMute(item) for item in chargersFilter
removeChargersFilter = -> removeMute(item) for item in chargersFilter

addBearsFilter = -> addMute(item) for item in bearsFilter
removeBearsFilter = -> removeMute(item) for item in bearsFilter

addLionsFilter = -> addMute(item) for item in lionsFilter
removeLionsFilter = -> removeMute(item) for item in lionsFilter

addPackersFilter = -> addMute(item) for item in packersFilter
removePackersFilter = -> removeMute(item) for item in packersFilter

addVikingsFilter = -> addMute(item) for item in vikingsFilter
removeVikingsFilter = -> removeMute(item) for item in vikingsFilter

addFalconsFilter = -> addMute(item) for item in falconsFilter
removeFalconsFilter = -> removeMute(item) for item in falconsFilter

addPanthersFilter = -> addMute(item) for item in panthersFilter
removePanthersFilter = -> removeMute(item) for item in panthersFilter

addSaintsFilter = -> addMute(item) for item in saintsFilter
removeSaintsFilter = -> removeMute(item) for item in saintsFilter

addBuccaneersFilter = -> addMute(item) for item in buccaneersFilter
removeBuccaneersFilter = -> removeMute(item) for item in buccaneersFilter

addCowboysFilter = -> addMute(item) for item in cowboysFilter
removeCowboysFilter = -> removeMute(item) for item in cowboysFilter

addGiantsFilter = -> addMute(item) for item in giantsFilter
removeGiantsFilter = -> removeMute(item) for item in giantsFilter

addEaglesFilter = -> addMute(item) for item in eaglesFilter
removeEaglesFilter = -> removeMute(item) for item in eaglesFilter

addRedskinsFilter = -> addMute(item) for item in redskinsFilter
removeRedskinsFilter = -> removeMute(item) for item in redskinsFilter

addCardinalsFilter = -> addMute(item) for item in cardinalsFilter
removeCardinalsFilter = -> removeMute(item) for item in cardinalsFilter

addFortyNinersFilter = -> addMute(item) for item in fortyNinersFilter
removeFortyNinersFilter = -> removeMute(item) for item in fortyNinersFilter

addSeahawksFilter = -> addMute(item) for item in seahawksFilter
removeSeahawksFilter = -> removeMute(item) for item in seahawksFilter

addRamsFilter = -> addMute(item) for item in ramsFilter
removeRamsFilter = -> removeMute(item) for item in ramsFilter

base = new Firebase('https://silencerio.firebaseIO.com/users')

currentUser = ->
  if localStorage['silencer']
    return JSON.parse(localStorage['silencer'])
  else
    return false

getMutes = -> currentUser().mutes

muteCount = -> currentUser().mutes.length

storeMutes = (user) ->
  localStorage.setItem('silencer', JSON.stringify(user))

  id = parseInt(user.id)
  userBase = base.child("/#{id}")
  userMuteBase = base.child("/#{id}/mutes")
  user.muteCount = if user.mutes then user.mutes.length else 0

  userBase.set(user)
  userMuteBase.set(user.mutes)

Array.prototype.remove = ->
  while (arguments.length && this.length)
    what = arguments[--arguments.length]
    while ((ax = @.indexOf(what)) != -1 )
      this.splice(ax, 1)
  return this

addMute = (newMute) ->
  user = currentUser()
  mutes = getMutes()

  if user
    for mute in mutes
      return if newMute == mute

    for word in reservedWords
      return if newMute == word

    mutes.push(newMute)
    mixpanel.track("Mute Added", {id: "#{newMute}"})

    user.mutes = mutes
    storeMutes(user)
  else
    chrome.tabs.create({ url: "http://silencer.io/auth" })

removeMute = (muteToBeRemoved) ->
  user = currentUser()
  mutes = getMutes()

  for mute in mutes
    mutes.remove(mute) if mute == muteToBeRemoved

  mixpanel.track("Term Removed", {id: "#{muteToBeRemoved}"})
  user.mutes = mutes
  storeMutes(user)


chrome.runtime.onMessage.addListener( (message, sender, sendResponse) ->
  if message.termSlidUp
    mixpanel.track("Content Removed From View", { id: "#{message.termSlidUp}", site: "#{message.site}" })

  if message.auth 
    chrome.tabs.create({ url: "http://silencer.io/auth" })

  if message.userInfo
    localStorage.setItem('silencer', "#{message.user}")
    user = JSON.parse(message.user)
    id = parseInt(user.id)

    userBase = base.child("/#{id}")
    userBase.set(user)

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
    if currentUser()
      addMutePack(message.mutePackName)
    else
      chrome.tabs.create({ url: "http://silencer.io/auth" })

  if message.mutePackRemove
    removeMutePack(message.mutePackName)
)
