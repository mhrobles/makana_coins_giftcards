import type { LeaderEntry } from '../types';
import { byPointsDesc } from '../utils/format';

// Data service (pure): returns deterministic ranking data.
export const getTopLeaders = (): LeaderEntry[] => {
  const data: LeaderEntry[] = [
    { name: 'Kai Horwitz', points: 300 },
    { name: 'Francisco Parada', points: 251 },
    { name: 'Fernanda Villa', points: 238 },
    { name: 'Fernando Tapia', points: 138 },
    { name: 'Valentina Garcia', points: 138 },
    { name: 'Hans Hartmann', points: 126 },
    { name: 'Cristobal Lopez', points: 125 },
    { name: 'Rosario Torres', points: 125 },
    { name: 'Vicente Mahesh', points: 76 },
    { name: 'Tu Usuario', points: 38 },
  ];
  return [...data].sort(byPointsDesc);
};

export const getUserPosition = (leaders: LeaderEntry[], userName: string) => {
  const idx = leaders.findIndex(l => l.name === userName);
  return idx >= 0 ? idx + 1 : null;
};
