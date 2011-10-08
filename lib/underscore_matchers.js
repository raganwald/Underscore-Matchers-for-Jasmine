/* DO NOT MODIFY. This file was compiled Sat, 08 Oct 2011 16:59:41 GMT from
 * /Users/raganwald/projects/Working-Title/app/coffeescript/jasmine/underscore_matchers.coffee
 */

(function() {
  var __slice = Array.prototype.slice, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  _.defaults(jasmine.Matchers.prototype, {
    toBeEmpty: function() {
      if (_.isFunction(this.actual.isEmpty)) {
        return this.actual.isEmpty();
      } else {
        return _.isEmpty(this.actual);
      }
    },
    toInclude: function() {
      var items;
      items = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return _(items).all(__bind(function(item) {
        return _(this.actual).include(item);
      }, this));
    },
    toIncludeAny: function() {
      var items;
      items = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return _(items).any(__bind(function(item) {
        return _(this.actual).include(item);
      }, this));
    }
  });
}).call(this);
