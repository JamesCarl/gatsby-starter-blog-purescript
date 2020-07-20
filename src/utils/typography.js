import { typography as _typography, rhythm as _rhythm, scale as _scale } from "../Lib/Utils/Typography.purs"
import { injectStyles } from "../Lib/Packages/Typography/Typography.purs"
const typography = _typography
// Hot reload typography in development.
if (process.env.NODE_ENV !== `production`) {
  injectStyles(typography)
}
export default typography
export const rhythm = _rhythm
export const scale = _scale 
