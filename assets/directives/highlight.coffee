# Highlight substring
class Highlight extends BaseDirective
  @options: ->
    scope:
      'highlight': '='
    restrict: 'A'
    link: (scope, elem, attrs) ->


  @register()
