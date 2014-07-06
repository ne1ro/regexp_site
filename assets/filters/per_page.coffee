# Filter array pages
app.filter 'perPage', ->
  (input, page) ->
    if input?
      _.map input[page * 10 ... (page + 1) * 10], (val) ->
        _.extend val,
          pgIndex: input.indexOf(val) + 1

