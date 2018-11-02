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
    .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
	.pipe(sourcemaps.write('.', { sourceRoot: '../src/' }))
    .pipe(gulp.dest('./dist/'));
});



gulp.task('bootstrap', function () {
   return gulp.src(bootstrapFiles)
	.pipe(sourcemaps.init())
    .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
 	.pipe(sourcemaps.write('.', { sourceRoot: '../src/' }))
    .pipe(gulp.dest('./dist/'));
});

gulp.task('javascript', function() {
 	return gulp.src('./src/**.js')
 		.pipe(gulp.dest('./dist/'));
});

gulp.task('copy-libs', function() {
	gulp.src('./node_modules/jquery/dist/jquery.min.js')
		.pipe(gulp.dest('./dist/lib/'));
	gulp.src('./node_modules/sidr/dist/jquery.sidr.min.js')
		.pipe(gulp.dest('./dist/lib/'));
	gulp.src('./node_modules/sidr/dist/stylesheets/jquery.sidr.dark.min.css')
		.pipe(gulp.dest('./dist/lib/'));
	gulp.src('./node_modules/bootstrap/dist/css/bootstrap.min.css')
		.pipe(gulp.dest('./dist/lib/'));
	return gulp.src('./node_modules/bootstrap/dist/js/bootstrap.min.js')
		.pipe(gulp.dest('./dist/lib/'));
});

gulp.task('default', ['sass', 'javascript', 'watch-sass', 'watch-bootstrap', 'watch-javascript']);