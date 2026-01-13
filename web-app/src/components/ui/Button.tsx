import { memo } from 'react';

type Props = {
  children: React.ReactNode;
  onClick?: () => void;
};

const Button = memo(({ children, onClick }: Props) => (
  <button className="btn" onClick={onClick}>{children}</button>
));

export default Button;
