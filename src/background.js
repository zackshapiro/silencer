// Generated by CoffeeScript 1.5.0
(function() {
  var addAdFilter, addBreakingBadFilter, addDexterFilter, addGoTFilter, addMmFilter, addMute, addMutePack, addNewsroomFilter, addOintbFilter, addPllFilter, addRoyalBabyFilter, addTbFilter, arrestedDevelopmentFilter, base, breakingBadFilter, currentUser, dexterFilter, getMutes, madMenFilter, muteCount, newsroomFilter, orangeNewBlackFilter, prettyLittleLiarsFilter, removeAdFilter, removeBreakingBadFilter, removeDexterFilter, removeGoTFilter, removeMmFilter, removeMute, removeMutePack, removeNewsroomFilter, removeOintbFilter, removePllFilter, removeRoyalBabyFilter, removeTbFilter, reservedWords, royalBabyFilter, storeMutes, thronesFilter, trueBloodFilter;

  thronesFilter = ["game of thrones", "of thrones", "#got", "little finger", "song of fire and ice", "sofai", "sofi", "lannister", "stark", "baratheon", "shae", "bronn", "cersei", "tyrion", "kingslayer", "king slayer", "margaery", "robb stark", "king of the north", "stannis", "daenerys", "khaleesi", "theon", "greyjoy", "grey joy", "gray joy", "grayjoy", "tyrell", "sansa", "arya", "jon snow", "brienne", "bran", "ygritte", "renly", "joffrey", "melisandre", "lord of light", "@gameofthrones", "#asoiaf", "dragon", "gotfans", "gameofthrones", "westeros", "joffrey", "red wedding", "redwedding", "gameofthronesfilter"];

  madMenFilter = ["#madmen", "don draper", "betty draper", "january jones", "jon hamm", "john hamm", "roger sterling", "joan", "joan harris", "peggy olsen", "peggy", "pete cambpell", "ken cosgrove", "harry crane", "henry francis", "betty francis", "megan draper", "jessica par", "sally draper", "dick whitman", "#madmenspoilers", "bobby draper", "michael ginsberg", "jane sterling", "john slattery", "bert cooper", "bertram cooper", "robert morse", "trudy cambpell", "megan", "don", "sterling", "campbell", "sterling cooper", "sterling cooper draper price", "scdp", "madmenfilter"];

  arrestedDevelopmentFilter = ["#arresteddevelopment", "bluth", "banana stand", "lucille", "gob", "george michael", "maebe", "maybe funke", "george sr", "george senior", "oscar bluth", "oscar", "buster", "baby buster", "boy fights", "tobias", "funke", "fünke", "bluth company", "mister f", "mrf", "ad2013", "mitch hurwitz", "mitch", "@mitchhurwitz", "stair car", "lucille two", "lucille 2", "lucille austero", "@arresteddev", "arrested development season 4", "magic", "illusion", "anustart", "a new start", "fake block", "fakeblock", "george maharis", "george maharris", "arresteddevelopmentfilter"];

  prettyLittleLiarsFilter = ["@abcfpll", "pll", "pretty little liars", "#prettylittleliars", "alison", "#pllfamily", "spencer hastings", "spencer", "hanna marin", "hanna", "hannah", "emily fields", "aria", "aria montgomery", "mona", "vanderwaal", "vanderwall", "sara shepard", "marline king", "rosewood", "'a'", "prettylittleliarsfilter"];

  trueBloodFilter = ["true blood", "#trueblood", "@truebloodhbo", "trueblood", "sookie", "sookie stackhouse", "bill compton", "northman", "tara thornton", "merlotte", "stackhouse", "lafayette", "arlene", "arlene fowler", "bellefleur", "hoyt", "lettie mae", "lettie mae thornton", "rene", "bud", "bud dearborne", "dawn", "amy", "amy burley", "adele", "eddie", "bellefleur", "jessica hamby", "reverend newlin", "reverend steve", "de beaufort", "pam swynford", "russell", "alcide", "holly", "luna", "nora", "niall", "nial", "nile", "truman", "rikki", "ricky", "herveaux", "ben flynn", "nicole wright", "truebloodfilter"];

  royalBabyFilter = ["catherine", "the queen", "queen elizabeth", "duchess of cambridge", "#royalbaby", "william", "duke of cambridge", "middleton", "carole", "buckingham palace", "highness", "throne", "duke", "duchess", "#royalbabynames", "labor", "royalbabyfilter"];

  breakingBadFilter = ["breaking bad", "walt", "walter white", "hank", "walter", "#breakingbad", "breakfast", "skyler", "beneke", "jesse", "pinkman", "gus", "gus fring", "fring", "@breakingbad_amc", "@rjmitte", "#bb", "#brba", "meth", "gilligan", "holly", "schrader", "gomez", "cook", "todd", "grey matter", "cancer", "scarface", "chips", "tuco", "salamanca", "meth lab", "super lab", "ricin", "declan", "mike", "ehrmentraut", "cranston", "gunn", "aaron paul", "mitte", "dean norris", "aaron paul", "@bryancranston", "@aaronpaul_8", "saul", "odenkirk", "jonathan banks", "marie", "walter jr", "junior", "lydia", "schwartz", "lambert", "skinny pete", "badger", "breakingbadfilter"];

  orangeNewBlackFilter = ["orange is the new black", "#ointb", "@ointb", "claudette", "sam healy", "sam healey", "larry", "nicky", "sophia", "piper", "tasty", "taystee", "pornstache", "@lavernecox", "susan", "joel", "wanda", "@piper", "daya", "crazy eyes", "aleida", "orangenewblackfilter"];

  dexterFilter = ["dexter", "#dexter", "@sho_dexter", "dexter morgan", "harrison", "astor", "cody", "hannah", "hanna", "rita", "maria", "angel", "harry", "vince", "kill room", "miami", "the code", "code of harry", "dark passenger", "bay harbor", "ice truck", "trinity", "moser", "bennett", "jacob", "elway", "evelyn", "vogel", "doomsday", "james daokes", "sargeant doakes", "sgt doakes", "miami metro", "santa muerte murders", "barrel girls", "dexterfilter"];

  newsroomFilter = ["the newsroom", "acn", "willmcavoyacn", "will", "mcavoy", "#thenewsroom", "#newsroom", "sloan", "@jeff_daniels", "@iamdrunksam", "charlie", "skinner", "neal", "@nealsampatacn", "mackmchaleacn", "mack", "jim", "jim harper", "maggie", "news night", "don keefer", "awm", "atlantis", "aaron sorkin", "oliva munn", "jonas", "leona", "reese", "kendra", "elliot", "nina", "tess", "gary", "martin", "tamara", "wade", "lonny", "lonnie", "hallie", "rebecca", "newsroomfilter"];

  reservedWords = ["reply", "retweet", "favorite", "expand", "more", "like", "comment", "share"];

  addMutePack = function(name) {
    if (name === "got") {
      addGoTFilter();
    }
    if (name === "mm") {
      addMmFilter();
    }
    if (name === "ad") {
      addAdFilter();
    }
    if (name === "pll") {
      addPllFilter();
    }
    if (name === "tb") {
      addTbFilter();
    }
    if (name === "rb") {
      addRoyalBabyFilter();
    }
    if (name === "bb") {
      addBreakingBadFilter();
    }
    if (name === "ointb") {
      addOintbFilter();
    }
    if (name === "dexter") {
      addDexterFilter();
    }
    if (name === "newsroom") {
      addNewsroomFilter();
    }
    if (name === "instagram") {
      addMute("instagram.com");
    }
    if (name === "glue") {
      addMute("getglue");
    }
    if (name === "ask") {
      addMute("ask.fm");
    }
    if (name === "vine") {
      addMute("vine.co");
    }
    if (name === "4sq") {
      addMute("4sq.com");
    }
    if (name === "path") {
      addMute("path.com");
    }
    if (name === "timehop") {
      addMute("t.imehop.com");
    }
    if (name === "medium") {
      addMute("medium.com");
    }
    if (name === "nike") {
      addMute("go.nike.com");
    }
    if (name === "circa") {
      addMute("cir.ca");
    }
    if (name === "paper") {
      return addMute("paper.li");
    }
  };

  removeMutePack = function(name) {
    if (name === "got") {
      removeGoTFilter();
    }
    if (name === "mm") {
      removeMmFilter();
    }
    if (name === "ad") {
      removeAdFilter();
    }
    if (name === "pll") {
      removePllFilter();
    }
    if (name === "tb") {
      removeTbFilter();
    }
    if (name === "rb") {
      removeRoyalBabyFilter();
    }
    if (name === "bb") {
      removeBreakingBadFilter();
    }
    if (name === "ointb") {
      removeOintbFilter();
    }
    if (name === "dexter") {
      removeDexterFilter();
    }
    if (name === "newsroom") {
      removeNewsroomFilter();
    }
    if (name === "instagram") {
      removeMute("instagram.com");
    }
    if (name === "glue") {
      removeMute("getglue");
    }
    if (name === "ask") {
      removeMute("ask.fm");
    }
    if (name === "vine") {
      removeMute("vine.co");
    }
    if (name === "4sq") {
      removeMute("4sq.com");
    }
    if (name === "path") {
      removeMute("path.com");
    }
    if (name === "timehop") {
      removeMute("t.imehop.com");
    }
    if (name === "medium") {
      removeMute("medium.com");
    }
    if (name === "nike") {
      removeMute("go.nike.com");
    }
    if (name === "circa") {
      removeMute("cir.ca");
    }
    if (name === "paper") {
      return removeMute("paper.li");
    }
  };

  addGoTFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = thronesFilter.length; _i < _len; _i++) {
      item = thronesFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeGoTFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = thronesFilter.length; _i < _len; _i++) {
      item = thronesFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addMmFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = madMenFilter.length; _i < _len; _i++) {
      item = madMenFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeMmFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = madMenFilter.length; _i < _len; _i++) {
      item = madMenFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addAdFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = arrestedDevelopmentFilter.length; _i < _len; _i++) {
      item = arrestedDevelopmentFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeAdFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = arrestedDevelopmentFilter.length; _i < _len; _i++) {
      item = arrestedDevelopmentFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addPllFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = prettyLittleLiarsFilter.length; _i < _len; _i++) {
      item = prettyLittleLiarsFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removePllFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = prettyLittleLiarsFilter.length; _i < _len; _i++) {
      item = prettyLittleLiarsFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addTbFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = trueBloodFilter.length; _i < _len; _i++) {
      item = trueBloodFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeTbFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = trueBloodFilter.length; _i < _len; _i++) {
      item = trueBloodFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addRoyalBabyFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = royalBabyFilter.length; _i < _len; _i++) {
      item = royalBabyFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeRoyalBabyFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = royalBabyFilter.length; _i < _len; _i++) {
      item = royalBabyFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addBreakingBadFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = breakingBadFilter.length; _i < _len; _i++) {
      item = breakingBadFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeBreakingBadFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = breakingBadFilter.length; _i < _len; _i++) {
      item = breakingBadFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addOintbFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = orangeNewBlackFilter.length; _i < _len; _i++) {
      item = orangeNewBlackFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeOintbFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = orangeNewBlackFilter.length; _i < _len; _i++) {
      item = orangeNewBlackFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addDexterFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = dexterFilter.length; _i < _len; _i++) {
      item = dexterFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeDexterFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = dexterFilter.length; _i < _len; _i++) {
      item = dexterFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  addNewsroomFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = newsroomFilter.length; _i < _len; _i++) {
      item = newsroomFilter[_i];
      _results.push(addMute(item));
    }
    return _results;
  };

  removeNewsroomFilter = function() {
    var item, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = newsroomFilter.length; _i < _len; _i++) {
      item = newsroomFilter[_i];
      _results.push(removeMute(item));
    }
    return _results;
  };

  base = new Firebase('https://silencerio.firebaseIO.com/users');

  currentUser = function() {
    if (localStorage['silencer']) {
      return JSON.parse(localStorage['silencer']);
    } else {
      return false;
    }
  };

  getMutes = function() {
    return currentUser().mutes;
  };

  muteCount = function() {
    return currentUser().mutes.length;
  };

  storeMutes = function(user) {
    var id, userBase;
    localStorage.setItem('silencer', JSON.stringify(user));
    id = parseInt(user.id);
    userBase = base.child("/" + id + "/mutes");
    return userBase.set(user.mutes);
  };

  Array.prototype.remove = function() {
    var ax, what;
    while (arguments.length && this.length) {
      what = arguments[--arguments.length];
      while ((ax = this.indexOf(what)) !== -1) {
        this.splice(ax, 1);
      }
    }
    return this;
  };

  addMute = function(newMute) {
    var mute, mutes, user, word, _i, _j, _len, _len1;
    user = currentUser();
    mutes = getMutes();
    if (user) {
      for (_i = 0, _len = mutes.length; _i < _len; _i++) {
        mute = mutes[_i];
        if (newMute === mute) {
          return;
        }
      }
      for (_j = 0, _len1 = reservedWords.length; _j < _len1; _j++) {
        word = reservedWords[_j];
        if (newMute === word) {
          return;
        }
      }
      mutes.push(newMute);
      mixpanel.track("Mute Added", {
        id: "" + newMute
      });
      user.mutes = mutes;
      return storeMutes(user);
    } else {
      return chrome.tabs.create({
        url: "http://silencer.io/auth"
      });
    }
  };

  removeMute = function(muteToBeRemoved) {
    var mute, mutes, user, _i, _len;
    user = currentUser();
    mutes = getMutes();
    for (_i = 0, _len = mutes.length; _i < _len; _i++) {
      mute = mutes[_i];
      if (mute === muteToBeRemoved) {
        mutes.remove(mute);
      }
    }
    mixpanel.track("Term Removed", {
      id: "" + muteToBeRemoved
    });
    user.mutes = mutes;
    return storeMutes(user);
  };

  chrome.runtime.onMessage.addListener(function(message, sender, sendResponse) {
    var id, user, userBase;
    if (message.termSlidUp) {
      mixpanel.track("Content Removed From View", {
        id: "" + message.termSlidUp,
        site: "" + message.site
      });
    }
    if (message.auth) {
      chrome.tabs.create({
        url: "http://silencer.io/auth"
      });
    }
    if (message.userInfo) {
      localStorage.setItem('silencer', "" + message.user);
      user = JSON.parse(message.user);
      id = parseInt(user.id);
      userBase = base.child("/" + id);
      userBase.set(user);
    }
    if (message.checkingForUser || message.mutesRequest) {
      sendResponse(currentUser());
    }
    if (message.contentScriptMutesRequest) {
      chrome.tabs.query({
        "active": true,
        "currentWindow": true
      }, function(tab) {
        return chrome.tabs.sendMessage(tab[0].id, {
          terms: currentUser().mutes
        });
      });
    }
    if (message.addMute) {
      addMute(message.term);
    }
    if (message.removeMute) {
      removeMute(message.term);
    }
    if (message.mutePackAdd) {
      if (currentUser()) {
        addMutePack(message.mutePackName);
      } else {
        chrome.tabs.create({
          url: "http://silencer.io/auth"
        });
      }
    }
    if (message.mutePackRemove) {
      return removeMutePack(message.mutePackName);
    }
  });

}).call(this);
