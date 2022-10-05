// Copyright 2021 Alex Woroschilow (alex@ergofox.me)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
const {
    src,
    dest,
    parallel,
    series,
    watch
} = require('gulp');
const gulp = require('gulp');
// Load plugins
const rename = require('gulp-rename');
const uglify = require('gulp-uglify');
const clean = require('gulp-clean');
const less = require('gulp-less');
const changed = require('gulp-changed');
const autoprefixer = require('gulp-autoprefixer');
const concat = require('gulp-concat');
const cssnano = require('gulp-cssnano');
const sass = require('gulp-sass')(require('sass'));
const browsersync = require('browser-sync').create();
const mjml = require('gulp-mjml')
const react = require('gulp-react');
const htmlreplace = require('gulp-html-replace');
var util = require("gulp-util");

// Clean assets
function clear() {
    return src([
        './build/*',
        './dist/*',
    ], {
        read: false,
        allowEmpty: true,
    }).pipe(clean());
}

function css() {

    src('./src/static/css/sass/*.sass')
        .pipe(sass())
        .pipe(autoprefixer({
            overrideBrowserslist: ['last 2 versions'],
            cascade: false
        }))
        .pipe(concat('framework.css'))
        .pipe(dest('./src/static/css'))
        .pipe(browsersync.stream());

    return src([
        './src/static/css/framework.css',
        './src/static/css/theme.css',
    ]).pipe(concat('main.css'))
      .pipe(dest('./src/static/css'))
      .pipe(dest('./dist/static/css'));
}

function assets() {
    return src([
    './assets/static/img/**/*',
    './src/static/img/**/*',
    ]).pipe(dest('./dist/static/img'));
}


function html() {
    return src('./src/*.html')
        .pipe(dest('./dist'));
}

// Watch files
function watch_files() {
    gulp.watch('./src/*.html', (done) => {
        gulp.series([html,])(done);
    });

    gulp.watch([
    './src/static/css/less/*.less',
    './src/static/css/sass/*.sass',
    './src/static/css/theme.css',
    ], (done) => {
        gulp.series([css, assets, html])(done);
    });
}

// BrowserSync
function browser_sync() {
    browsersync.init({
        server: {
            baseDir: './src'
        },
        port: 3000
    });
}


exports.export = series(series(clear,
    parallel(css, html, assets),
), function () {

    src('./dist/static/css/*')
        .pipe(dest('../../apps/frontend/static/css'));

    return src('./dist/static/img/*')
        .pipe(dest('../../apps/frontend/static/img'));
});

// Tasks to define the execution of the functions simultaneously or in series
exports.watch = parallel(watch_files, browser_sync);
exports.default = series(clear, css, html, assets);
