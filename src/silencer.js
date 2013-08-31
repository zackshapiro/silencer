// Generated by CoffeeScript 1.6.3
(function() {
  var namespace,
    __slice = [].slice;

  namespace = function(target, name, block) {
    var item, top, _i, _len, _ref, _ref1;
    if (arguments.length < 3) {
      _ref = [(typeof exports !== 'undefined' ? exports : window)].concat(__slice.call(arguments)), target = _ref[0], name = _ref[1], block = _ref[2];
    }
    top = target;
    _ref1 = name.split('.');
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      item = _ref1[_i];
      target = target[item] || (target[item] = {});
    }
    return block(target, top);
  };

  namespace('Silencer', function(exports, top) {
    exports.term_vars = [];
    return exports.terms = function() {
      return exports.term_vars;
    };
  });

  $(function() {
    var detectSite, filterFacebook, filterTwitter, genericFilter, getTerms, hideChild, sendUserInfo;
    sendUserInfo = function() {
      if (localStorage['silencerAuth']) {
        chrome.runtime.sendMessage({
          userInfo: true,
          user: localStorage['silencerAuth']
        });
        return localStorage.clear();
      }
    };
    getTerms = function() {
      return chrome.runtime.sendMessage({
        contentScriptMutesRequest: true
      });
    };
    detectSite = function() {
      if (document.URL.indexOf('facebook') > -1) {
        filterFacebook();
        setInterval(filterFacebook, 2500);
      }
      if (document.URL.indexOf('twitter') > -1) {
        filterTwitter();
        setInterval(filterTwitter, 2500);
      }
      if (document.URL.indexOf("silencer.io/auth") > -1) {
        setInterval(sendUserInfo, 1500);
      }
      if (document.URL.indexOf("localhost:3001/auth") > -1) {
        return setInterval(sendUserInfo, 1500);
      }
    };
    hideChild = function(child) {
      return child.slideUp();
    };
    genericFilter = function(parentDiv) {
      var child, children, parent, term, _i, _len, _results;
      getTerms();
      parent = parentDiv;
      children = parentDiv.children();
      _results = [];
      for (_i = 0, _len = children.length; _i < _len; _i++) {
        child = children[_i];
        _results.push((function() {
          var _j, _len1, _ref, _results1;
          _ref = this.Silencer.terms();
          _results1 = [];
          for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
            term = _ref[_j];
            if ($(child).css('display') !== 'none') {
              if ($($(child)).text().toLowerCase().indexOf(term) > -1) {
                if ($(child).find('.fullname').text() !== $('.js-mini-current-user .fullname').first().text()) {
                  hideChild($(child));
                  _results1.push(chrome.runtime.sendMessage({
                    termSlidUp: "" + term,
                    site: "twitter"
                  }));
                } else {
                  _results1.push(void 0);
                }
              } else {
                _results1.push(void 0);
              }
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };
    filterTwitter = function() {
      if ($(".route-home").length || document.URL.indexOf("twitter.com/search") > -1 || $('.list-stream').length) {
        return genericFilter($('.stream-items'));
      }
    };
    filterFacebook = function() {
      var child, children, stream, term, _i, _len, _results;
      getTerms();
      stream = $(".uiStream");
      children = $(stream).children(".genericStreamStory");
      _results = [];
      for (_i = 0, _len = children.length; _i < _len; _i++) {
        child = children[_i];
        _results.push((function() {
          var _j, _len1, _ref, _results1;
          _ref = this.Silencer.terms();
          _results1 = [];
          for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
            term = _ref[_j];
            if ($(child).is(":visible")) {
              if ($(child).text().toLowerCase().indexOf(term.toLowerCase()) > -1) {
                hideChild($(child));
                _results1.push(chrome.runtime.sendMessage({
                  termSlidUp: "" + term,
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
        }).call(this));
      }
      return _results;
    };
    chrome.extension.onMessage.addListener(function(message, sender) {
      if (message.terms) {
        return this.Silencer.term_vars = message.terms;
      }
    });
    return detectSite();
  });

}).call(this);
