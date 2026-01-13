import { memo } from 'react';

type Props = {
  children: React.ReactNode;
  style?: React.CSSProperties;
};

const Card = memo(({ children, style }: Props) => (
  <div className="card" style={style}>{children}</div>
));

export default Card;
