module.exports = (grunt) ->
  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    coffee:
      options:
        sourceMap: yes
      compile:
        files: [{
          expand: yes
          cwd: 'assets/'
          src: [ '*.coffee' ]
          dest: 'dist/'
          ext: '.js'
        }]

    sass:
      options:
        style: 'compressed'
      dist:
        files: [{
          expand: true
          cwd: 'assets'
          src: [ '*.sass' ]
          dest: 'dist/'
          ext: '.css'
        }]

    watch:
      options:
        livereload: yes
        dateFormat: (time) ->
          grunt.log.writeln "The watch finished in #{time}ms at #{new Date().toLocaleTimeString()}"
      coffee:
        files: ['assets/**/*.coffee']
        tasks: ['coffee']
      sass:
        files: ['assets/**/*.sass']
        tasks: ['sass']

  # compile
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  # server
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'build', ['coffee', 'sass']
  grunt.registerTask 'default', ['build', 'watch']