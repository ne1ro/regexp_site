######
# Grunt tasks config
######
paths =
  app: 'app'
  client: 'assets'
  dist: 'public'
  scripts: [
    'assets/app.coffee'
    'assets/classes/*.coffee'
    'assets/services/*.coffee'
    'assets/controllers/*.coffee'
    'assets/directives/*.coffee'
    'assets/filters/*.coffee'
  ]
  deps: [
    'bower_components/angular/angular.min.js'
    'bower_components/lodash/dist/lodash.min.js'
    'bower_components/restangular/dist/restangular.min.js'
    'bower_components/angular-ui-router/release/angular-ui-router.min.js'
  ]
  styles: "assets/styles/*.sass"
  views: "assets/**/*.jade"


module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  # Project config
  grunt.initConfig
    clean:
      dev: [paths.dist]

    coffee:
      compile:
        options:
          bare: true
          join: true
          sourceMap: true
        expand: true
        cwd: paths.client
        src: '**/*.coffee'
        dest: "#{paths.dist}/js/build/"
        ext: '.js'

    concat:
      dev_scripts:
        src: paths.deps.concat ["#{paths.dist}/js/build/**/*.js"]
        dest: "#{paths.dist}/js/app.js"

    jade:
      dev:
        options:
          pretty: true
        files: [
          expand: true
          cwd: paths.client
          src: '**/*.jade'
          ext: '.html'
          dest: paths.dist
        ]

    sass:
      dev:
        options:
          style: 'expanded'
        files:
          'public/css/app.css' : paths.styles

    nodemon:
      dev:
        script: 'app.coffee'
        options:
          exec: 'iced'
          watchedExtensions: ['coffee']
          watchedFolders: [paths.app]

    watch:
      scripts:
        files: paths.scripts
        tasks: ['coffee', 'concat:dev_scripts']
        options:
          livereload: true
      views:
        files: paths.views
        tasks: ['jade']
        options:
          livereload: true

    concurrent:
      dev_build: ['jade:dev', 'sass:dev', 'concat:dev_scripts']
      devServer: ['nodemon', 'watch']


  # Set custom tasks
  grunt.registerTask 'default', ['clean:dev', 'coffee', 'concurrent:dev_build', 'concurrent:devServer']