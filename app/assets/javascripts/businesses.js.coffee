$ ->
  $('#business_search').typeahead
    name: "business"
    remote: "/businesses/autocomplete?query=%QUERY"