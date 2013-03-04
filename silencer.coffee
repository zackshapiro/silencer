$ ->

  if $('#queue').length > 0
    articles = $('#queue')
    articlesLength = articles.children().length
    articlesArray = articles.children()

    debugger

    for article in articlesArray 
      console.log "article!"
    