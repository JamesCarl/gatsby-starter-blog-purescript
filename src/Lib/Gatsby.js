var { graphql, useStaticQuery, TemplateStringsArray } = require("gatsby")
exports.graphql_ = function (definition) {
    return graphql(new Array(definition))
}
exports.useStaticQuery_ = function (graphqlTemplate) {
    return () => useStaticQuery(graphqlTemplate)
}