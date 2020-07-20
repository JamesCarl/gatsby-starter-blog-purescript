var { graphql, useStaticQuery } = require("gatsby")

exports.graphqlBioQuery_ = function () { return () => useStaticQuery(graphql`query BioQuery { avatar: file(absolutePath: { regex: "/profile-pic.jpg/" }) { childImageSharp { fixed(width: 50, height: 50) { ...GatsbyImageSharpFixed }}} site { siteMetadata {author {name summary} social {twitter}}}}`) }

