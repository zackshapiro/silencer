// Generated by CoffeeScript 1.5.0
(function() {

  $(function() {
    var article, articles, articlesArray, articlesLength, filterTerms, hideChild, term, tweet, tweets, tweetsArray, tweetsLength, _i, _j, _k, _len, _len1, _len2, _results;
    filterTerms = ["4sq.com", "vine.co", "@vine", "Andrew Hyde", "@andrewhyde", "#sxsw", "#sxsw2013", "SXSW", "humblebrag", "who.unfollowed.me", "Benny  "];
    chrome.extension.onMessage.addListener(function(message, sender, sendResponse) {
      return sendResponse(filterTerms);
    });
    hideChild = function(child) {
      return child.hide();
    };
    if ($('#queue').length > 0) {
      articles = $('#queue');
      articlesArray = articles.children();
      articlesLength = articlesArray.length;
      for (_i = 0, _len = articlesArray.length; _i < _len; _i++) {
        article = articlesArray[_i];
        for (_j = 0, _len1 = filterTerms.length; _j < _len1; _j++) {
          term = filterTerms[_j];
          if ($($(article).find(".title").children()[0]).text().indexOf(term) > -1) {
            hideChild($(article));
          }
        }
      }
    }
    if ($(".stream-items").children().length > 0) {
      tweets = $(".stream-items");
      tweetsArray = tweets.children();
      tweetsLength = tweetsArray.length;
      _results = [];
      for (_k = 0, _len2 = tweetsArray.length; _k < _len2; _k++) {
        tweet = tweetsArray[_k];
        _results.push((function() {
          var _l, _len3, _results1;
          _results1 = [];
          for (_l = 0, _len3 = filterTerms.length; _l < _len3; _l++) {
            term = filterTerms[_l];
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
  });

}).call(this);
