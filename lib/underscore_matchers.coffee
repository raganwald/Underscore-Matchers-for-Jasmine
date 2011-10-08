_.defaults jasmine.Matchers.prototype,

  toBeEmpty: ->
    if _.isFunction(@actual.isEmpty) then @actual.isEmpty() else _.isEmpty(@actual)

  toInclude: (items...) ->
    _(items).all (item) =>
      _(@actual).include(item)

  toIncludeAny: (items...) ->
    _(items).any (item) =>
      _(@actual).include(item)
