var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

var bootstrapFiles = [
	'./src/_variables.scss',
	'./src/_bootstrap-override.scss',
	'./src/bootstrap.scss',
	'./src/wysiwyg.scss'];
var bootstrapFilesExclude = bootstrapFiles.map((v) => '!' + v);
var sourceFilesWithoutBootstrap = ['./src/**/*.scss'];
sourceFilesWithoutBootstrap = sourceFilesWithoutBootstrap.concat(bootstrapFilesExclude);

gulp.task('watch-sass', function () {
	gulp.watch(sourceFilesWithoutBootstrap, ['sass']);
});

gulp.task('watch-bootstrap', function () {
	gulp.watch(bootstrapFiles, ['bootstrap', 'sass']);
});

gulp.task('watch-javascript', function () {
	gulp.watch(['./src/**.js'], ['javascript']);
});

gulp.task('sass', function () {
  return gulp.src(sourceFilesWithoutBootstrap)
	.pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
	.pipe(sourcemaps.write('.', { sourceRoot: '../src/' }))
    .pipe(gulp.dest('./dist/'));
});



gulp.task('bootstrap', function () {
   return gulp.src(bootstrapFiles)
	.pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
 	.pipe(sourcemaps.write('.', { sourceRoot: '../src/' }))
    .pipe(gulp.dest('./dist/'));
});

gulp.task('javascript', function() {
 	return gulp.src('./src/**.js')
 		.pipe(gulp.dest('./dist/'));
});

gulp.task('bootstrap-js', function() {
	return gulp.src('./bower_components\bootstrap-sass\assets\javascripts/bootstrap.min.js')
		.pipe(gulp.dest('./dist/bootstrap/'));
});

gulp.task('default', ['sass', 'javascript', 'watch-sass', 'watch-bootstrap', 'watch-javascript']);