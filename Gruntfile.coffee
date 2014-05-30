module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-develop')
  grunt.loadNpmTasks('grunt-npm-install')

  grunt.initConfig
    
    develop:
      server:
        file: 'app.coffee'
        cmd: './node_modules/coffee-script/bin/coffee'

    watch:
      coffee:
        files: 'src/client/js/*.coffee'
        tasks: ['coffee:compile']
      uglify:
        files: 'public/assets/js/*.js'
        tasks: ['uglify:target']

    uglify:
      target:
        files: [
          expand: true,
          cwd: "#{__dirname}/public/assets/js",
          src: "**/*.js",
          dest: "#{__dirname}/public/assets/js"
        ]

    coffee:
      compile:
        options: 
          bare: true
        expand: true,
        flatten: true,
        cwd: "#{__dirname}/src/client/js/",
        src: ['*.coffee'],
        dest: "#{__dirname}/public/assets/js/",
        ext: '.js'


  grunt.registerTask 'default', ['npm-install','dev']

  grunt.registerTask 'dev',
    ['develop', 'watch']