import { memo } from 'react';

export const Title = memo(({ children }: { children: React.ReactNode }) => (
  <h1 className="title">{children}</h1>
));

export const Subtitle = memo(({ children }: { children: React.ReactNode }) => (
  <h2 className="subtitle">{children}</h2>
));
