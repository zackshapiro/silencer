if ($(".queue_list").length > 0) {

  var articles = $(".queue_list");
  var articles_length = articles.children().length;

  for (i = 0; i < articles_length; i++) {
    alert(articles.children()[i]);
  }
};