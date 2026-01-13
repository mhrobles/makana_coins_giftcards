import { memo } from 'react';

type Props = {
  children: React.ReactNode;
  gap?: number;
};

const Row = memo(({ children, gap }: Props) => (
  <div className="row" style={gap ? { gap } : undefined}>{children}</div>
));

export default Row;
