$ ->

  filterTerms = [
    "Apple",
    "Frank Chimero",
    "Coke",
    "Privacy",
    "San Francisco",
    "Canon"
  ]

  if $('#queue').length > 0
    articles = $('#queue')
    articlesArray = articles.children()
    articlesLength = articles.children().length

    for article in articlesArray
      for term in filterTerms
        if $($(article).find(".title").children()[0]).text().indexOf(term) > -1 then $(article).hide()