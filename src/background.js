// Generated by CoffeeScript 1.5.0
(function() {

  chrome.runtime.onMessage.addListener(function(message, sender, sendResponse) {
    mixpanel.track("Term Removed From View", {
      id: "" + message.term,
      site: "" + message.site
    });
    return sendResponse({
      note: "term tracked"
    });
  });

}).call(this);
