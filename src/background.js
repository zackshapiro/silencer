// Generated by CoffeeScript 1.5.0
(function() {
  var base;

  base = new Firebase('https://silencerio.firebaseIO.com/');

  chrome.runtime.onMessage.addListener(function(message, sender, sendResponse) {
    if (message.term) {
      mixpanel.track("Content Removed From View", {
        id: "" + message.term,
        site: "" + message.site
      });
      sendResponse({
        note: "term tracked"
      });
    }
    if (message.auth) {
      chrome.tabs.create({
        url: "http://silencer.io/auth"
      });
    }
    if (message.userInfo) {
      return localStorage.setItem('silencer', "" + message.user);
    }
  });

}).call(this);
