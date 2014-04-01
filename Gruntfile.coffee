module.exports = (grunt) ->
    grunt.initConfig {
        pkg: grunt.file.readJSON 'package.json'
        concat: {
            dist: {
                src: ['src/*.js']
                dest: 'dist/<%= pkg.name %>.js'
            }
        }
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            }
            dist: {
                files: {
                    'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']
                }
            }
        }
        jshint: {
            files: ['Gruntfile.js', 'src/*.js']
        }
        watch: {
            files: ['<%= jshint.files %>']
            tasks: ['jshint']
        }
    }

    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.registerTask 'default', ['jshint', 'concat', 'uglify']
