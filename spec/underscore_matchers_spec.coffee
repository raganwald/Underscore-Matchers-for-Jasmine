$ ->

  describe "toBeEmpty", ->

    it 'should work for arrays', ->

      expect([]).toBeEmpty()
      expect([1]).not.toBeEmpty()

    if Backbone?

      it 'should work for backbone collections', ->
        c = new Backbone.Collection()
        expect(c).toBeEmpty()
        c.add
          foo: 'bar'

        expect(c).not.toBeEmpty()


  describe "toInclude", ->

    it 'should work for arrays', ->

      expect([]).not.toInclude('s')
      expect(['s', 'n', 'a', 'f', 'u']).toInclude('f', 'a', 'n')
      expect(['s', 'n', 'a', 'f', 'u']).not.toInclude('p', 'a', 'n')
      expect(['s', 'n', 'a', 'f', 'u']).not.toInclude('f', 'a', 'x')

    if Backbone?

      it 'should work for backbone collections', ->
        c = new Backbone.Collection()
        [s, n, a, f, u, p, x] = [new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model()]
        expect(c).not.toInclude(s)

        c.add [s, n, a, f, u]

        expect(c).toInclude f, a, n
        expect(c).not.toInclude p, a, n
        expect(c).not.toInclude f, a, x


  describe "toIncludeAny", ->

    it 'should work for arrays', ->

      expect([]).not.toIncludeAny('s')
      expect(['s', 'n', 'a', 'f', 'u']).toIncludeAny('f', 'a', 'n')
      expect(['s', 'n', 'a', 'f', 'u']).toIncludeAny('p', 'a', 'n')
      expect(['s', 'n', 'a', 'f', 'u']).toIncludeAny('f', 'a', 'x')
      expect(['s', 'n', 'a', 'f', 'u']).not.toIncludeAny('p', 'x')

    if Backbone?

      it 'should work for backbone collections', ->
        c = new Backbone.Collection()
        [s, n, a, f, u, p, x] = [new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model(), new Backbone.Model()]
        expect(c).not.toIncludeAny(s)

        c.add [s, n, a, f, u]

        expect(c).toIncludeAny f, a, n
        expect(c).toIncludeAny p, a, n
        expect(c).toIncludeAny f, a, x
        expect(c).not.toIncludeAny p, x