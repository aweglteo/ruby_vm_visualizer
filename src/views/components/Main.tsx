import React from 'react'

type Props = {
  text: string
}

const Main: React.FC<Props> = ({ text }) => (
  <div>
    <p>{text}</p>
  </div>
)
export default Main
