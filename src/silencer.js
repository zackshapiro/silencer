// Generated by CoffeeScript 1.5.0
(function() {

  $(function() {
    var addAdFilter, addGoTFilter, addMmFilter, addPllFilter, addRoyalBabyFilter, addTbFilter, addTerm, arrestedDevelopmentFilter, detectSite, filterFacebook, filterTwitter, genericFilter, getTerms, hideChild, injectJquery, madMenFilter, makeTermArray, prettyLittleLiarsFilter, removeAdFilter, removeGoTFilter, removeMmFilter, removePllFilter, removeRoyalBabyFilter, removeTbFilter, removeTerm, reservedWords, royalBabyFilter, sendUserInfo, storeTerms, thronesFilter, toggleMutePack, trueBloodFilter;
    thronesFilter = ["game of thrones", "of thrones", "#got", "little finger", "song of fire and ice", "sofai", "sofi", "lannister", "stark", "baratheon", "shae", "bronn", "cersei", "tyrion", "kingslayer", "king slayer", "margaery", "robb stark", "king of the north", "stannis", "daenerys", "khaleesi", "theon", "greyjoy", "grey joy", "gray joy", "grayjoy", "tyrell", "sansa", "arya", "jon snow", "brienne", "bran", "ygritte", "renly", "joffrey", "melisandre", "lord of light", "@gameofthrones", "#asoiaf", "dragon", "gotfans", "gameofthrones", "westeros", "joffrey", "red wedding", "redwedding", "gameofthronesfilter"];
    madMenFilter = ["#madmen", "don draper", "betty draper", "january jones", "jon hamm", "john hamm", "roger sterling", "joan", "joan harris", "peggy olsen", "peggy", "pete cambpell", "ken cosgrove", "harry crane", "henry francis", "betty francis", "megan draper", "jessica par", "sally draper", "dick whitman", "#madmenspoilers", "bobby draper", "michael ginsberg", "jane sterling", "john slattery", "bert cooper", "bertram cooper", "robert morse", "trudy cambpell", "megan", "don", "sterling", "campbell", "sterling cooper", "sterling cooper draper price", "scdp", "madmenfilter"];
    arrestedDevelopmentFilter = ["#arresteddevelopment", "bluth", "banana stand", "lucille", "gob", "george michael", "maebe", "maybe funke", "george sr", "george senior", "oscar bluth", "oscar", "buster", "baby buster", "boy fights", "tobias", "funke", "fünke", "bluth company", "mister f", "mrf", "ad2013", "mitch hurwitz", "mitch", "@mitchhurwitz", "stair car", "lucille two", "lucille 2", "lucille austero", "@arresteddev", "arrested development season 4", "magic", "illusion", "anustart", "a new start", "fake block", "fakeblock", "george maharis", "george maharris", "arresteddevelopmentfilter"];
    prettyLittleLiarsFilter = ["@abcfpll", "pll", "pretty little liars", "#prettylittleliars", "alison", "#pllfamily", "spencer hastings", "spencer", "hanna marin", "hanna", "hannah", "emily fields", "aria", "aria montgomery", "mona", "vanderwaal", "vanderwall", "sara shepard", "marline king", "rosewood", "'a'", "prettylittleliarsfilter"];
    trueBloodFilter = ["true blood", "#trueblood", "@truebloodhbo", "trueblood", "sookie", "sookie stackhouse", "bill compton", "northman", "tara thornton", "merlotte", "stackhouse", "lafayette", "arlene", "arlene fowler", "bellefleur", "hoyt", "lettie mae", "lettie mae thornton", "rene", "bud", "bud dearborne", "dawn", "amy", "amy burley", "adele", "eddie", "bellefleur", "jessica hamby", "reverend newlin", "reverend steve", "de beaufort", "pam swynford", "russell", "alcide", "holly", "luna", "nora", "niall", "nial", "nile", "truman", "rikki", "ricky", "herveaux", "ben flynn", "nicole wright", "truebloodfilter"];
    royalBabyFilter = ["catherine", "the queen", "queen elizabeth", "duchess of cambridge", "#royalbaby", "william", "duke of cambridge", "middleton", "carole", "buckingham palace", "highness", "throne", "duke", "duchess", "#royalbabynames", "labor", "royalbabyfilter"];
    reservedWords = ["reply", "retweet", "favorite", "expand", "more", "like", "comment", "share"];
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
    injectJquery = function() {
      var body, script;
      script = document.createElement("script");
      script.type = "text/javascript";
      script.src = "/lib/jquery-1.9.1.min.js";
      body = document.getElementsByTagName("body")[0];
      return body.appendChild(script);
    };
    sendUserInfo = function() {
      if (localStorage['silencerAuth']) {
        return chrome.runtime.sendMessage({
          userInfo: true,
          user: localStorage['silencerAuth']
        });
      }
    };
    detectSite = function() {
      if (document.URL.indexOf('facebook') > -1) {
        injectJquery();
        filterFacebook();
        setInterval(filterFacebook, 4000);
      }
      if (document.URL.indexOf('twitter') > -1) {
        filterTwitter();
        setInterval(filterTwitter, 4000);
      }
      if (document.URL.indexOf("localhost:3000/auth") > -1) {
        return setInterval(sendUserInfo, 1500);
      }
    };
    storeTerms = function(terms) {
      return localStorage.setItem("silencer", JSON.stringify(terms));
    };
    getTerms = function() {
      var first, item, myList, myNewList, terms, _i, _len;
      if (!localStorage["silencer"]) {
        first = {
          "term": "sample muted term"
        };
        localStorage.setItem('silencer', JSON.stringify(first));
      }
      myList = localStorage.getItem("silencer");
      myNewList = JSON.parse(myList);
      terms = [];
      for (_i = 0, _len = myNewList.length; _i < _len; _i++) {
        item = myNewList[_i];
        terms.push(item['term'].toLowerCase());
      }
      return terms;
    };
    toggleMutePack = function(action) {
      if (action === "got-add") {
        addGoTFilter();
      }
      if (action === "got-remove") {
        removeGoTFilter();
      }
      if (action === "mm-add") {
        addMmFilter();
      }
      if (action === "mm-remove") {
        removeMmFilter();
      }
      if (action === "ad-add") {
        addAdFilter();
      }
      if (action === "ad-remove") {
        removeAdFilter();
      }
      if (action === "pll-add") {
        addPllFilter();
      }
      if (action === "pll-remove") {
        removePllFilter();
      }
      if (action === "tb-add") {
        addTbFilter();
      }
      if (action === "tb-remove") {
        removeTbFilter();
      }
      if (action === "rb-add") {
        addRoyalBabyFilter();
      }
      if (action === "rb-remove") {
        removeRoyalBabyFilter();
      }
      if (action === "instagram-add") {
        addTerm("instagram.com");
      }
      if (action === "instagram-remove") {
        removeTerm("instagram.com");
      }
      if (action === "vine-add") {
        addTerm("vine.co");
      }
      if (action === "vine-remove") {
        removeTerm("vine.co");
      }
      if (action === "4sq-add") {
        addTerm("4sq.com");
      }
      if (action === "4sq-remove") {
        removeTerm("4sq.com");
      }
      if (action === "path-add") {
        addTerm("path.com");
      }
      if (action === "path-remove") {
        removeTerm("path.com");
      }
      if (action === "timehop-add") {
        addTerm("t.imehop.com");
      }
      if (action === "timehop-remove") {
        removeTerm("t.imehop.com");
      }
      if (action === "medium-add") {
        addTerm("medium.com");
      }
      if (action === "medium-remove") {
        removeTerm("medium.com");
      }
      if (action === "nike-add") {
        addTerm("go.nike.com");
      }
      if (action === "nike-remove") {
        removeTerm("go.nike.com");
      }
      if (action === "circa-add") {
        addTerm("cir.ca");
      }
      if (action === "circa-remove") {
        removeTerm("cir.ca");
      }
      if (action === "paper-add") {
        addTerm("paper.li");
      }
      if (action === "paper-remove") {
        return removeTerm("paper.li");
      }
    };
    addGoTFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = thronesFilter.length; _i < _len; _i++) {
        item = thronesFilter[_i];
        _results.push(addTerm(item));
      }
      return _results;
    };
    removeGoTFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = thronesFilter.length; _i < _len; _i++) {
        item = thronesFilter[_i];
        _results.push(removeTerm(item));
      }
      return _results;
    };
    addMmFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = madMenFilter.length; _i < _len; _i++) {
        item = madMenFilter[_i];
        _results.push(addTerm(item));
      }
      return _results;
    };
    removeMmFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = madMenFilter.length; _i < _len; _i++) {
        item = madMenFilter[_i];
        _results.push(removeTerm(item));
      }
      return _results;
    };
    addAdFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = arrestedDevelopmentFilter.length; _i < _len; _i++) {
        item = arrestedDevelopmentFilter[_i];
        _results.push(addTerm(item));
      }
      return _results;
    };
    removeAdFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = arrestedDevelopmentFilter.length; _i < _len; _i++) {
        item = arrestedDevelopmentFilter[_i];
        _results.push(removeTerm(item));
      }
      return _results;
    };
    addPllFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = prettyLittleLiarsFilter.length; _i < _len; _i++) {
        item = prettyLittleLiarsFilter[_i];
        _results.push(addTerm(item));
      }
      return _results;
    };
    removePllFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = prettyLittleLiarsFilter.length; _i < _len; _i++) {
        item = prettyLittleLiarsFilter[_i];
        _results.push(removeTerm(item));
      }
      return _results;
    };
    addTbFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = trueBloodFilter.length; _i < _len; _i++) {
        item = trueBloodFilter[_i];
        _results.push(addTerm(item));
      }
      return _results;
    };
    removeTbFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = trueBloodFilter.length; _i < _len; _i++) {
        item = trueBloodFilter[_i];
        _results.push(removeTerm(item));
      }
      return _results;
    };
    addRoyalBabyFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = royalBabyFilter.length; _i < _len; _i++) {
        item = royalBabyFilter[_i];
        _results.push(addTerm(item));
      }
      return _results;
    };
    removeRoyalBabyFilter = function() {
      var item, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = royalBabyFilter.length; _i < _len; _i++) {
        item = royalBabyFilter[_i];
        _results.push(removeTerm(item));
      }
      return _results;
    };
    addTerm = function(newTerm) {
      var term, termArray, _i, _j, _len, _len1;
      termArray = makeTermArray();
      for (_i = 0, _len = termArray.length; _i < _len; _i++) {
        term = termArray[_i];
        if (newTerm.toLowerCase() === term.term) {
          return;
        }
      }
      for (_j = 0, _len1 = reservedWords.length; _j < _len1; _j++) {
        term = reservedWords[_j];
        if (newTerm.toLowerCase() === term) {
          return;
        }
      }
      termArray.push({
        "term": newTerm
      });
      return storeTerms(termArray);
    };
    removeTerm = function(termToBeRemoved) {
      var newTermList, term, terms, _i, _j, _len, _len1;
      terms = getTerms();
      for (_i = 0, _len = terms.length; _i < _len; _i++) {
        term = terms[_i];
        if (term === termToBeRemoved) {
          terms.remove(term);
        }
      }
      newTermList = [];
      for (_j = 0, _len1 = terms.length; _j < _len1; _j++) {
        term = terms[_j];
        newTermList.push({
          "term": term
        });
      }
      return storeTerms(newTermList);
    };
    makeTermArray = function() {
      var term, termArray, terms, _i, _len;
      termArray = [];
      terms = getTerms();
      for (_i = 0, _len = terms.length; _i < _len; _i++) {
        term = terms[_i];
        termArray.push({
          "term": "" + term
        });
      }
      return termArray;
    };
    hideChild = function(child) {
      return child.slideUp();
    };
    genericFilter = function(parentDiv) {
      var child, children, parent, term, terms, _i, _len, _results;
      terms = getTerms();
      parent = parentDiv;
      children = parentDiv.children();
      _results = [];
      for (_i = 0, _len = children.length; _i < _len; _i++) {
        child = children[_i];
        _results.push((function() {
          var _j, _len1, _results1;
          _results1 = [];
          for (_j = 0, _len1 = terms.length; _j < _len1; _j++) {
            term = terms[_j];
            if ($(child).is(":visible")) {
              if ($($(child)).text().toLowerCase().indexOf(term.toLowerCase()) > -1) {
                hideChild($(child));
                _results1.push(chrome.runtime.sendMessage({
                  term: "" + term,
                  site: "twitter"
                }));
              } else {
                _results1.push(void 0);
              }
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        })());
      }
      return _results;
    };
    filterTwitter = function() {
      if ($(".route-home").length || document.URL.indexOf("twitter.com/search") > -1 || $('.list-stream').length) {
        return genericFilter($('.stream-items'));
      }
    };
    filterFacebook = function() {
      var child, children, stream, term, terms, _i, _len, _results;
      terms = getTerms();
      stream = $(".uiStream");
      children = $(stream).children(".genericStreamStory");
      _results = [];
      for (_i = 0, _len = children.length; _i < _len; _i++) {
        child = children[_i];
        _results.push((function() {
          var _j, _len1, _results1;
          _results1 = [];
          for (_j = 0, _len1 = terms.length; _j < _len1; _j++) {
            term = terms[_j];
            if ($(child).is(":visible")) {
              if ($(child).text().toLowerCase().indexOf(term.toLowerCase()) > -1) {
                hideChild($(child));
                _results1.push(chrome.runtime.sendMessage({
                  term: "" + term,
                  site: "facebook"
                }));
              } else {
                _results1.push(void 0);
              }
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        })());
      }
      return _results;
    };
    detectSite();
    return chrome.extension.onMessage.addListener(function(message, sender, sendResponse) {
      if (message === "showTerms") {
        sendResponse(getTerms());
      } else {
        if (message.substring(0, 3) === "add") {
          message = message.slice(3);
          addTerm(message);
          sendResponse(makeTermArray());
        } else if (message.substring(0, 6) === "remove") {
          message = message.slice(6);
          removeTerm(message);
          sendResponse(makeTermArray());
        }
      }
      if (message.substring(0, 6) === "filter") {
        message = message.slice(6);
        return toggleMutePack(message);
      }
    });
  });

}).call(this);
