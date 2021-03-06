multiselect = null
dispatcher = null

module "[Unit] Multi-select unit tests",
  setup: ->
    Ember.run ->
      dispatcher = Ember.EventDispatcher.create()
      dispatcher.setup()
      multiselect = Ember.Widgets.MultiSelectComponent.create
        content: ['foo', 'bar', 'barca', 'baz']

  teardown: ->
    Ember.run ->
      dispatcher.destroy()
      multiselect.destroy()

test 'Test preparedContent after some options are already selected', ->
  expect 2
  multiselect.set 'selections', ['bar', 'baz']
  multiselect.set 'query', 'ba'
  equal(multiselect.get('preparedContent').length, 1)
  equal(multiselect.get('preparedContent')[0], 'barca')
