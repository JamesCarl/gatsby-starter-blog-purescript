import { graphql } from "gatsby"
import { index } from "../Lib/Pages/Index.purs"
export default index
export const pageQuery = graphql`
  query {
    site {
      siteMetadata {
        title
        author { 
          name 
          summary 
     
        } 
        social {
            twitter
        }
      }
    }
    avatar: file(absolutePath: { 
      regex: "/profile-pic.jpg/" 
    }) { 
      childImageSharp { 
          fixed(width: 50, height: 50) { 
              ...GatsbyImageSharpFixed 
          }
      }
    } 
    allMarkdownRemark(sort: { fields: [frontmatter___date], order: DESC }) {
      edges {
        node {
          excerpt
          fields {
            slug
          }
          frontmatter {
            date(formatString: "MMMM DD, YYYY")
            title
            description
          }
        }
      }
    }
  }
`