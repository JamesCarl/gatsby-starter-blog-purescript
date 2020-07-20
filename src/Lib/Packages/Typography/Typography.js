"use strict";
var Typography = require("typography");
exports.typography_ = function (options) {
    const t = new Typography(options)
    return t
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