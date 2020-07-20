"use strict";
exports.wordpress2016_ = function () { return require("typography-theme-wordpress-2016").default }
exports.setOverrideThemeStyles_ = function (options) {
    return function (obj) {
        options.overrideThemeStyles = function () { return obj }
        return options
    }
}
exports.delete_ = function (key) {
    return function (options) {
        delete options[key]
        return options
    }
}