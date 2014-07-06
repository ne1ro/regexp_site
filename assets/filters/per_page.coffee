# Filter array pages
app.filter 'perPage', ->
  (input, page) ->
    if input?
      input[page * 10 ... (page + 1) * 10]

