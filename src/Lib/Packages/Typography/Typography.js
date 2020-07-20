"use strict";
var Typography = require("typography")
exports.typography_ = function (options) {
    return new Typography(options)
}
exports.createStyles_ = function (t) {
    return t.createStyles()
}
exports.toJson_ = function (t) {
    return t.toJSON()
}
exports.injectStyles_ = function (t) {
    return t.injectStyles()
}