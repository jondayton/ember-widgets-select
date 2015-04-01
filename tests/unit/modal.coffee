modal = null
dispatcher = null

module "[Unit] Modal unit tests",
  setup: ->
    Ember.run ->
      dispatcher = Ember.EventDispatcher.create()
      dispatcher.setup()
      modal = Ember.Widgets.ModalComponent.popup()

  teardown: ->
    Ember.run ->
      dispatcher.destroy()
      modal.destroy()

test 'Test tab loop only inside modal', ->
  expect 3
  modalComponent = modal.$()
  Ember.run ->
    buttonConfirm = find '.btn-confirm', modalComponent
    buttonCancel = find '.btn-cancel', modalComponent
    ok isActiveElement(buttonConfirm, modalComponent, 'Button confirm should be focused')

    # test TAB keyboard, the next element should be focused
    keyEvent(buttonConfirm, 'keydown', 9)
    .then ->
      ok isActiveElement(buttonCancel, modalComponent, 'Button cancel should be focused')

      # test TAB keyboard, the fist element should be focused
      keyEvent(buttonCancel, 'keydown', 9)
    .then ->
      ok isActiveElement(buttonConfirm, modalComponent, 'Button confirm should be focused')
