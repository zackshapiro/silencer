chrome.runtime.onMessage.addListener( (message, sender, sendResponse) -> 
  mixpanel.track("Term Removed From View", { id: "#{message.term}", site: "#{message.site}" })
  sendResponse({note: "term tracked"})
)