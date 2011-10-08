invoke = (method_name, args...) ->
  if _.isFunction(@actual[method_name])
    @actual[method_name].apply(@actual, args)
  else
    args.unshift(@actual)
    _[method_name].apply(@actual, args)

_.defaults jasmine.Matchers.prototype,

  toBeEmpty: ->
    invoke.call(this, 'isEmpty')

  toInclude: (items...) ->
    _(items).all (item) =>
      invoke.call(this, 'include', item)

  toIncludeAny: (items...) ->
    _(items).any (item) =>
      invoke.call(this, 'include', item)
