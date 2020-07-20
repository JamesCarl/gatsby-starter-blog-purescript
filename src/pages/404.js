import { graphql } from "gatsby"
import { page } from "../Lib/Pages/FourZeroFour.purs"
export default page
export const pageQuery = graphql`
  query {
    site {
      siteMetadata {
        title
      }
    }
  }
`
