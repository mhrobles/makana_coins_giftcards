import { memo } from 'react';
import type { LeaderEntry } from '../types';
import { rankLabel } from '../utils/format';

type Props = {
  entry: LeaderEntry;
  index: number;
};

const LeaderItem = memo(({ entry, index }: Props) => (
  <div className="leader-item">
    <div>
      {rankLabel(index)} &nbsp;
      <strong>{entry.name}</strong>
    </div>
    <div>
      <strong>{entry.points}</strong> <span className="muted">pts</span>
    </div>
  </div>
));

export default LeaderItem;
