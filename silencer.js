// Generated by CoffeeScript 1.5.0
(function() {

  $(function() {
    var addTerm, filterTwitter, getTerms, hideChild, makeTermArray, storeTerms, termList;
    storeTerms = function(terms) {
      return localStorage.setItem("myFilteredTerms", JSON.stringify(terms));
    };
    getTerms = function(myFilteredTerms) {
      var item, myList, myNewList, terms, _i, _len;
      myList = localStorage.getItem("myFilteredTerms");
      myNewList = JSON.parse(myList);
      terms = [];
      for (_i = 0, _len = myNewList.length; _i < _len; _i++) {
        item = myNewList[_i];
        terms.push(item['term']);
      }
      return terms;
    };
    addTerm = function(newTerm, myFilteredTerms) {
      myFilteredTerms.push({
        "term": newTerm
      });
      return storeTerms(myFilteredTerms);
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
      return child.hide();
    };
    filterTwitter = function(termList) {
      var term, tweet, tweets, tweetsArray, tweetsLength, _i, _len, _results;
      if ($(".stream-items").children().length > 0) {
        tweets = $(".stream-items");
        tweetsArray = tweets.children();
        tweetsLength = tweetsArray.length;
        _results = [];
        for (_i = 0, _len = tweetsArray.length; _i < _len; _i++) {
          tweet = tweetsArray[_i];
          _results.push((function() {
            var _j, _len1, _results1;
            _results1 = [];
            for (_j = 0, _len1 = termList.length; _j < _len1; _j++) {
              term = termList[_j];
              if ($(tweet).is(":visible")) {
                if ($($(tweet)).text().toLowerCase().indexOf(term.toLowerCase()) > -1) {
                  _results1.push(hideChild($(tweet)));
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
      }
    };
    if (localStorage['myFilteredTerms']) {
      termList = getTerms(localStorage['myFilteredTerms']);
    }
    filterTwitter(termList);
    return chrome.extension.onMessage.addListener(function(message, sender, sendResponse) {
      console.log(message);
      if (message !== "showTerms") {
        addTerm(message, makeTermArray());
        return sendResponse(makeTermArray());
      } else {
        return sendResponse(termList);
      }
    });
  });

}).call(this);
