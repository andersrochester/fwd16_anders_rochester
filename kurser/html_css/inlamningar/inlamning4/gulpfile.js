var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var browserSync = require('browser-sync');

gulp.task('browserSync', function() {
browserSync({
              server: {
                       baseDir: 'app'
                      }
           });
         });

gulp.task('sass',function() {

return gulp.src('app/scss/**/*.scss')

.pipe(sourcemaps.init())

.pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))

.pipe(sourcemaps.write('./maps'))
.pipe(gulp.dest('app/css'))
stream: true

});
