# Base layout for Angular.js directives
class @BaseDirective
  @register: (args...)->
    args.push @options
    app.directive "#{@name[0].toLowerCase()}#{@name[1..]}", args
