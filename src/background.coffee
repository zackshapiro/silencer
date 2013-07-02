base = new Firebase('https://silencerio.firebaseIO.com/')

authClient = new FirebaseAuthClient(base, (error, user) ->
  if error
    alert(error)
  else if user
    alert('User ID: ' + user.id + ', Provider: ' + user.provider)
  else
    # user is logged out
)

chrome.runtime.onMessage.addListener( (message, sender, sendResponse) ->
  if message.term
    mixpanel.track("Content Removed From View", { id: "#{message.term}", site: "#{message.site}" })
    sendResponse({note: "term tracked"})

  if message.auth
    authClient.login('twitter', { rememberMe: true })
)
