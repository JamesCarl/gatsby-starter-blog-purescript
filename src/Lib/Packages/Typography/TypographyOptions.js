
exports.overrideStyles_ = function (options) {
    return function (_rhythm) {
        return function (_options) {
            return function (_styles) {
                return options.overrideStyles(_rhythm, _options, styles)
            }
        }
    }
}

exports.overrideThemeStyles_ = function (options) {
    return function (_rhythm) {
        return function (_options) {
            return function (_styles) {
                return options.overrideThemeStyles(_rhythm, _options, styles)
            }
        }
    }
}