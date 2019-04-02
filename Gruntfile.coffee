module.exports = (grunt) ->

  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt

  # Configurable paths for the application
  appConfig=
    config:
      src: "config/grunt/*"

    app:
      path: require("./bower.json").appPath or "src"
      dist: "dist"
      test: "test"
      tmp: ".tmp"

    scripts:
      libs: [
          "node_modules/@angular/router-deprecated/**/*",
          "node_modules/@angular/upgrade/**/*",
          "node_modules/systemjs/dist/system.src.js",
          "node_modules/systemjs/dist/system-polyfills.js",
          "node_modules/rxjs/**/*",
          "node_modules/es6-shim/es6-shim.*",
          "node_modules/zone.js/dist/zone.js",
          "node_modules/reflect-metadata/Reflect.*",
          #'node_modules/ng2-ui-auth/export.js'

        ]
      app: [
        'build/app/components/{,*/}{,*/}*.js'
        'build/app/shared/{,*/}{,*/}*.js'
      ]

    stylesheets: [
      'build/app.css'
      'bower_components/nprogress/nprogress.css'
    ]

  # Define the configuration for all the tasks
  configs = require("load-grunt-configs") grunt, appConfig

  grunt.initConfig configs

 

  #Scripts
  grunt.registerTask 'scripts', [
    'ts', 'clean:ts'#, 'concat'
    ]

  grunt.registerTask 'stylesheets', [
    'sass', 'cssmin', 'clean:scss'
  ]

  grunt.registerTask 'templates', [
    'jade', 'clean:jade', 'hashres'
  ]

  grunt.registerTask 'serve', ['clean:build', 'copy', 'scripts', 'stylesheets', 'templates', 'connect', 'watch']
