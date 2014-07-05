# Base layout for Angular.js factory
class @BaseFactory
  # Register factory
  @register: (args...) ->
    app.factory @name, this
    @$inject = args

  constructor: (args...) ->
    # Inject dependencies
    for key, index in @constructor.$inject
      this[key] = args[index]

    return @initialize?()
