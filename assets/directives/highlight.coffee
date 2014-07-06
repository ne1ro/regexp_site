# Highlight substring
class Highlight extends BaseDirective
  @options: ->
    scope:
      'highlight': '='
    restrict: 'A'
    link: (scope, elem, attrs) ->
      console.log elem.html()
      for key of elem
        console.log key


  @register()
