chrome.runtime.onMessage.addListener( (message, sender, sendResponse) ->
  if message.term
    mixpanel.track("Content Removed From View", { id: "#{message.term}", site: "#{message.site}" })
    sendResponse({note: "term tracked"})
)

apiToken = "myApiToken1851u71081"

fakeToken = ""

# chrome.runtime.onMessage.addListener( (message, sender, sendResponse) ->
#   if message.token
#     window.token = message.token
#     # sendResponse({token: fakeToken})
#   if message.tokenNeeded == true
#     sendResponse({token: window.token})
# )