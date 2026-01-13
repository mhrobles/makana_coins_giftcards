import { memo } from 'react';

const Section = memo(({ children }: { children: React.ReactNode }) => (
  <section className="section">{children}</section>
));

export default Section;
