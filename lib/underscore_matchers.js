(function() {
  var invoke;
  var __slice = Array.prototype.slice, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  invoke = function() {
    var args, method_name;
    method_name = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    if (_.isFunction(this.actual[method_name])) {
      return this.actual[method_name].apply(this.actual, args);
    } else {
      args.unshift(this.actual);
      return _[method_name].apply(this.actual, args);
    }
  };
  _.defaults(jasmine.Matchers.prototype, {
    toBeEmpty: function() {
      return invoke.call(this, 'isEmpty');
    },
    toInclude: function() {
      var items;
      items = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return _(items).all(__bind(function(item) {
        return invoke.call(this, 'include', item);
      }, this));
    },
    toIncludeAny: function() {
      var items;
      items = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return _(items).any(__bind(function(item) {
        return invoke.call(this, 'include', item);
      }, this));
    },
    toBeCompact: function() {
      var elements;
      elements = invoke.call(this, 'map', _.identity);
      return _.isEqual(elements, _.compact(elements));
    },
    toBeUnique: function() {
      var elements;
      elements = invoke.call(this, 'map', _.identity);
      return _.isEqual(elements, _.uniq(elements));
    },
    toRespondTo: function() {
      var methods;
      methods = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return _.all(methods, __bind(function(method) {
        return _.isFunction(this.actual[method]);
      }, this));
    }
  });
}).call(this);