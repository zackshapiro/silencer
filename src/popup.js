// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    var handleCategory, setMuteValue,
      _this = this;
    $('.term-to-submit').focus();
    $(".log-in").click(function(e) {
      e.preventDefault();
      return chrome.runtime.sendMessage({
        auth: true
      });
    });
    chrome.runtime.sendMessage({
      checkingForUser: true
    }, function(response) {
      if (response !== false) {
        return $(".log-in").hide();
      }
    });
    setMuteValue = function(terms) {
      var term, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = terms.length; _i < _len; _i++) {
        term = terms[_i];
        if (term === "gameofthronesfilter") {
          $(".add-got").text("Unmute");
        }
        if (term === "madmenfilter") {
          $(".add-mm").text("Unmute");
        }
        if (term === "arresteddevelopmentfilter") {
          $(".add-ad").text("Unmute");
        }
        if (term === "prettylittleliarsfilter") {
          $(".add-pll").text("Unmute");
        }
        if (term === "truebloodfilter") {
          $(".add-tb").text("Unmute");
        }
        if (term === "royalbabyfilter") {
          $(".add-rb").text("Unmute");
        }
        if (term === "breakingbadfilter") {
          $(".add-bb").text("Unmute");
        }
        if (term === "orangenewblackfilter") {
          $(".add-ointb").text("Unmute");
        }
        if (term === "dexterfilter") {
          $(".add-dex").text("Unmute");
        }
        if (term === "newsroomfilter") {
          $(".add-newsroom").text("Unmute");
        }
        if (term === "instagram.com") {
          $(".add-ig").text("Unmute");
        }
        if (term === "getglue") {
          $(".add-glue").text("Unmute");
        }
        if (term === "ask.fm") {
          $(".add-ask").text("Unmute");
        }
        if (term === "vine.co") {
          $(".add-vine").text("Unmute");
        }
        if (term === "4sq.com") {
          $(".add-4sq").text("Unmute");
        }
        if (term === "path.com") {
          $(".add-path").text("Unmute");
        }
        if (term === "t.imehop.com") {
          $(".add-th").text("Unmute");
        }
        if (term === "medium.com") {
          $(".add-medium").text("Unmute");
        }
        if (term === "go.nike.com") {
          $(".add-nike").text("Unmute");
        }
        if (term === "cir.ca") {
          $(".add-circa").text("Unmute");
        }
        if (term === "paper.li") {
          $(".add-paper").text("Unmute");
        }
        if (term === "nflfilter") {
          $(".add-nfl").text("Unmute all");
        }
        if (term === "afcfilter") {
          $(".add-afc").text("Unmute all");
        }
        if (term === "nfcfilter") {
          $(".add-nfc").text("Unmute all");
        }
        if (term === "ravensfilter") {
          $(".add-bal").text("Unmute");
        }
        if (term === "bengalsfilter") {
          $(".add-cin").text("Unmute");
        }
        if (term === "brownsfilter") {
          $(".add-cle").text("Unmute");
        }
        if (term === "steelersfilter") {
          $(".add-pit").text("Unmute");
        }
        if (term === "texansfilter") {
          $(".add-hou").text("Unmute");
        }
        if (term === "coltsfilter") {
          $(".add-ind").text("Unmute");
        }
        if (term === "jaguarsfilter") {
          $(".add-jax").text("Unmute");
        }
        if (term === "titansfilter") {
          $(".add-ten").text("Unmute");
        }
        if (term === "billsfilter") {
          $(".add-buf").text("Unmute");
        }
        if (term === "dolphinsfilter") {
          $(".add-mia").text("Unmute");
        }
        if (term === "patriotsfilter") {
          $(".add-ne").text("Unmute");
        }
        if (term === "jetsfilter") {
          $(".add-nyj").text("Unmute");
        }
        if (term === "broncosfilter") {
          $(".add-den").text("Unmute");
        }
        if (term === "chiefsfilter") {
          $(".add-kc").text("Unmute");
        }
        if (term === "raidersfilter") {
          $(".add-oak").text("Unmute");
        }
        if (term === "chargersfilter") {
          $(".add-sd").text("Unmute");
        }
        if (term === "bearsfilter") {
          $(".add-chi").text("Unmute");
        }
        if (term === "lionsfilter") {
          $(".add-det").text("Unmute");
        }
        if (term === "packersfilter") {
          $(".add-gb").text("Unmute");
        }
        if (term === "vikingsfilter") {
          $(".add-min").text("Unmute");
        }
        if (term === "falconsfilter") {
          $(".add-atl").text("Unmute");
        }
        if (term === "panthersfilter") {
          $(".add-car").text("Unmute");
        }
        if (term === "saintsfilter") {
          $(".add-no").text("Unmute");
        }
        if (term === "buccaneersfilter") {
          $(".add-bucs").text("Unmute");
        }
        if (term === "cowboysfilter") {
          $(".add-dal").text("Unmute");
        }
        if (term === "giantsfilter") {
          $(".add-nyg").text("Unmute");
        }
        if (term === "eaglesfilter") {
          $(".add-phi").text("Unmute");
        }
        if (term === "redskinsfilter") {
          $(".add-wsh").text("Unmute");
        }
        if (term === "cardinalsfilter") {
          $(".add-ari").text("Unmute");
        }
        if (term === "fortyninersfilter") {
          $(".add-sf").text("Unmute");
        }
        if (term === "seahawksfilter") {
          $(".add-sea").text("Unmute");
        }
        if (term === "ramsfilter") {
          _results.push($(".add-stl").text("Unmute"));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };
    handleCategory = function(event, selector, message, filterName) {
      var team, teams, _i, _j, _len, _len1;
      event.preventDefault();
      if ($(selector).text() === "Mute") {
        if (filterName === "afc" || "nfc") {
          teams = $(selector).parent().parent().children().find('.cta');
          $(selector).text("Unmute");
          for (_i = 0, _len = teams.length; _i < _len; _i++) {
            team = teams[_i];
            $(team).text("Unmute");
          }
          mixpanel.track("" + message + " Added");
          return chrome.runtime.sendMessage({
            mutePackAdd: true,
            mutePackName: filterName
          });
        } else {
          mixpanel.track("" + message + " Added");
          chrome.runtime.sendMessage({
            mutePackAdd: true,
            mutePackName: filterName
          });
          return $(selector).text("Unmute");
        }
      } else {
        if (filterName === "afc" || "nfc") {
          teams = $(selector).parent().parent().children().find('.cta');
          $(selector).text("Mute");
          for (_j = 0, _len1 = teams.length; _j < _len1; _j++) {
            team = teams[_j];
            $(team).text("Mute");
          }
          mixpanel.track("" + message + " Removed");
          return chrome.runtime.sendMessage({
            mutePackRemove: true,
            mutePackName: filterName
          });
        } else {
          mixpanel.track("" + message + " Removed");
          chrome.runtime.sendMessage({
            mutePackRemove: true,
            mutePackName: filterName
          });
          return $(selector).text("Mute");
        }
      }
    };
    $('.pack-expander').click(function(e) {
      e.preventDefault();
      if ($('.filter-packs').css('display') !== 'none') {
        return $('.filter-packs').slideUp();
      } else {
        return $('.filter-packs').slideDown();
      }
    });
    $('.my-form').submit(function() {
      var newTerm;
      newTerm = $('.term-to-submit').val().toLowerCase();
      if (newTerm !== "") {
        chrome.runtime.sendMessage({
          addMute: true,
          term: newTerm
        });
        return $(".terms").append($('<li></li>', {
          "class": "term",
          "data-term": "" + newTerm,
          "text": "" + newTerm
        }));
      }
    });
    $('.mute.submit').click(function() {
      var newTerm;
      $('.term-to-submit').focus();
      newTerm = $('.term-to-submit').val().toLowerCase();
      if (newTerm !== "") {
        chrome.runtime.sendMessage({
          addMute: true,
          term: newTerm
        });
        $(".terms").append($('<li></li>', {
          "class": "term",
          "data-term": "" + newTerm,
          "text": "" + newTerm
        }));
      }
      return $('.term-to-submit').val("");
    });
    chrome.tabs.query({
      active: true,
      currentWindow: true
    }, function(tab) {
      return chrome.runtime.sendMessage({
        mutesRequest: true
      }, function(response) {
        var child, term, _i, _j, _len, _len1, _ref, _ref1;
        if (response.mutes) {
          setMuteValue(response.mutes);
          _ref = response.mutes;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            term = _ref[_i];
            $(".terms").append($('<li></li>', {
              "class": "term",
              "data-term": "" + term,
              "text": "" + term
            }));
          }
          _ref1 = $(".terms").children();
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            child = _ref1[_j];
            $(child).append($('<div></div>', {
              "class": 'removal',
              "text": '+'
            }));
            $(child).wrapInner("<a href='#' class='remove-term'></a>");
          }
        }
        return mixpanel.track('Silencer Opened');
      });
    });
    $(".terms").on('click', 'li a', (function(e) {
      var term;
      e.preventDefault();
      term = $(e.currentTarget).parent().data("term");
      $(e.currentTarget).parent().slideUp();
      return chrome.runtime.sendMessage({
        removeMute: true,
        term: term
      });
    }));
    /* Adding filters*/

    $('.add-got').click(function(e) {
      return handleCategory(e, '.add-got', "GoT Filter", "got");
    });
    $('.add-mm').click(function(e) {
      return handleCategory(e, '.add-mm', "Mad Men Filter", "mm");
    });
    $('.add-ad').click(function(e) {
      return handleCategory(e, '.add-ad', "Arrested Development Filter", "ad");
    });
    $('.add-pll').click(function(e) {
      return handleCategory(e, '.add-pll', "Prety Little Liars Filter", "pll");
    });
    $('.add-tb').click(function(e) {
      return handleCategory(e, '.add-tb', "True Blood Filter", "tb");
    });
    $('.add-rb').click(function(e) {
      return handleCategory(e, '.add-rb', "Royal Baby Filter", "rb");
    });
    $('.add-bb').click(function(e) {
      return handleCategory(e, '.add-bb', "Breaking Bad Filter", "bb");
    });
    $('.add-ointb').click(function(e) {
      return handleCategory(e, '.add-ointb', "Orange is the New Black Filter", "ointb");
    });
    $('.add-dex').click(function(e) {
      return handleCategory(e, '.add-dex', "Dexter Filter", "dexter");
    });
    $('.add-newsroom').click(function(e) {
      return handleCategory(e, '.add-newsroom', "The Newsroom Filter", "newsroom");
    });
    $('.add-ig').click(function(e) {
      return handleCategory(e, '.add-ig', "Instagram Mute", "instagram");
    });
    $('.add-ask').click(function(e) {
      return handleCategory(e, '.add-ask', "Ask.fm Mute", "ask");
    });
    $('.add-glue').click(function(e) {
      return handleCategory(e, '.add-glue', "GetGlue Mute", "glue");
    });
    $('.add-vine').click(function(e) {
      return handleCategory(e, '.add-vine', "Vine Mute", "vine");
    });
    $('.add-4sq').click(function(e) {
      return handleCategory(e, '.add-4sq', "Foursquare Mute", "4sq");
    });
    $('.add-path').click(function(e) {
      return handleCategory(e, '.add-path', "Path Mute", "path");
    });
    $('.add-th').click(function(e) {
      return handleCategory(e, '.add-th', "Timehop Mute", "timehop");
    });
    $('.add-medium').click(function(e) {
      return handleCategory(e, '.add-medium', "Medium Mute", "medium");
    });
    $('.add-nike').click(function(e) {
      return handleCategory(e, '.add-nike', "Nike+ Mute", "nike");
    });
    $('.add-circa').click(function(e) {
      return handleCategory(e, '.add-circa', "Circa Mute", "circa");
    });
    $('.add-paper').click(function(e) {
      return handleCategory(e, '.add-paper', "Paper.li Mute", "paper");
    });
    $(".add-nfl").click(function(e) {
      return handleCategory(e, ".add-nfl", "NFL Filter", "nfl");
    });
    $(".add-afc").click(function(e) {
      return handleCategory(e, ".add-afc", "NFL Filter", "afc");
    });
    $(".add-nfc").click(function(e) {
      return handleCategory(e, ".add-nfc", "NFL Filter", "nfc");
    });
    $(".add-bal").click(function(e) {
      return handleCategory(e, ".add-bal", "Ravens Filter", "bal");
    });
    $(".add-cin").click(function(e) {
      return handleCategory(e, ".add-cin", "Bengals Filter", "cin");
    });
    $(".add-cle").click(function(e) {
      return handleCategory(e, ".add-cle", "Browns Filter", "cle");
    });
    $(".add-pit").click(function(e) {
      return handleCategory(e, ".add-pit", "Steelers Filter", "pit");
    });
    $(".add-hou").click(function(e) {
      return handleCategory(e, ".add-hou", "Texans Filter", "hou");
    });
    $(".add-ind").click(function(e) {
      return handleCategory(e, ".add-ind", "Colts Filter", "ind");
    });
    $(".add-jax").click(function(e) {
      return handleCategory(e, ".add-jax", "Jaguars Filter", "jax");
    });
    $(".add-ten").click(function(e) {
      return handleCategory(e, ".add-ten", "Titans Filter", "ten");
    });
    $(".add-buf").click(function(e) {
      return handleCategory(e, ".add-buf", "Bills Filter", "buf");
    });
    $(".add-mia").click(function(e) {
      return handleCategory(e, ".add-mia", "Dolphins Filter", "mia");
    });
    $(".add-ne").click(function(e) {
      return handleCategory(e, ".add-ne", "Patriots Filter", "ne");
    });
    $(".add-nyj").click(function(e) {
      return handleCategory(e, ".add-nyj", "Jets Filter", "nyj");
    });
    $(".add-den").click(function(e) {
      return handleCategory(e, ".add-den", "Broncos Filter", "den");
    });
    $(".add-kc").click(function(e) {
      return handleCategory(e, ".add-kc", "Chiefs Filter", "kc");
    });
    $(".add-oak").click(function(e) {
      return handleCategory(e, ".add-oak", "Raiders Filter", "oak");
    });
    $(".add-sd").click(function(e) {
      return handleCategory(e, ".add-sd", "Chargers Filter", "sd");
    });
    $(".add-chi").click(function(e) {
      return handleCategory(e, ".add-chi", "Bears Filter", "chi");
    });
    $(".add-det").click(function(e) {
      return handleCategory(e, ".add-det", "Lions Filter", "det");
    });
    $(".add-gb").click(function(e) {
      return handleCategory(e, ".add-gb", "Packers Filter", "gb");
    });
    $(".add-min").click(function(e) {
      return handleCategory(e, ".add-min", "Vikings Filter", "min");
    });
    $(".add-atl").click(function(e) {
      return handleCategory(e, ".add-atl", "Falcons Filter", "atl");
    });
    $(".add-car").click(function(e) {
      return handleCategory(e, ".add-car", "Panthers Filter", "car");
    });
    $(".add-no").click(function(e) {
      return handleCategory(e, ".add-no", "Saints Filter", "no");
    });
    $(".add-bucs").click(function(e) {
      return handleCategory(e, ".add-bucs", "Buccaneers Filter", "bucs");
    });
    $(".add-dal").click(function(e) {
      return handleCategory(e, ".add-dal", "Cowboys Filter", "dal");
    });
    $(".add-nyg").click(function(e) {
      return handleCategory(e, ".add-nyg", "Giants Filter", "nyg");
    });
    $(".add-phi").click(function(e) {
      return handleCategory(e, ".add-phi", "Eagles Filter", "phi");
    });
    $(".add-wsh").click(function(e) {
      return handleCategory(e, ".add-wsh", "Redskins Filter", "wsh");
    });
    $(".add-ari").click(function(e) {
      return handleCategory(e, ".add-ari", "Cardinals Filter", "ari");
    });
    $(".add-sf").click(function(e) {
      return handleCategory(e, ".add-sf", "49ers Filter", "sf");
    });
    $(".add-sea").click(function(e) {
      return handleCategory(e, ".add-sea", "Seahawks Filter", "sea");
    });
    return $(".add-stl").click(function(e) {
      return handleCategory(e, ".add-stl", "Rams Filter", "stl");
    });
  });

}).call(this);
