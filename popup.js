// Generated by CoffeeScript 1.5.0
(function() {

  $(function() {
    var newTerm;
    if ($('.my-form').submit && $('.term-to-submit').val() !== "") {
      newTerm = $('.term-to-submit').val();
      return chrome.tabs.query({
        "active": true,
        "currentWindow": true
      }, function(tab) {
        return chrome.tabs.sendMessage(tab[0].id, newTerm, function(response) {
          return console.log(response);
        });
      });
    } else {
      return chrome.tabs.query({
        "active": true,
        "currentWindow": true
      }, function(tab) {
        return chrome.tabs.sendMessage(tab[0].id, "showTerms", function(response) {
          var term, terms, _i, _len, _results;
          console.log(JSON.stringify(response));
          terms = response;
          _results = [];
          for (_i = 0, _len = terms.length; _i < _len; _i++) {
            term = terms[_i];
            _results.push($(".terms").append($('<li></li>', {
              "class": "term",
              "text": "" + term
            })));
          }
          return _results;
        });
      });
    }
  });

}).call(this);
