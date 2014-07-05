# Base layout for Angular.js decorators
class @BaseDecorator
  # Register decorator
  @register: (args...) ->
    app.config ($provide) =>
      args = ['$delegate'].concat args
      args.push this.provide
      $provide.decorator '$log', args
