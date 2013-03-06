$ ->

  filterTerms = [
    "Apple",
    "Frank Chimero",
    "Coke",
    "Privacy"
  ]

  if $('#queue').length > 0
    articles = $('#queue')
    articlesArray = articles.children()
    articlesLength = articles.children().length

    for article in articlesArray
      # TODO: Loop through filter terms and plug them into indexOf
      if $($(article).find(".title").children()[0]).text().indexOf("Staying") > -1 then $(article).hide()

    # console.log filterTerms