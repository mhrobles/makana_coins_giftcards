import { memo } from 'react';

type Props = { children: React.ReactNode };

const Badge = memo(({ children }: Props) => (
  <span className="badge">{children}</span>
));

export default Badge;
