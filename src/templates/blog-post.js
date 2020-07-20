import { graphql } from "gatsby"
import { blogPost } from "../Lib/Templates/BlogPost.purs"
export default blogPost

export const pageQuery = graphql`
  query BlogPostBySlug($slug: String!) {
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
    markdownRemark(fields: { slug: { eq: $slug } }) {
      id
      excerpt(pruneLength: 160)
      html
      frontmatter {
        title
        date(formatString: "MMMM DD, YYYY")
        description
      }
    }
  }
`
