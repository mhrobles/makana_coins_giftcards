// Pure utility helpers for formatting and calculation (functional, stateless)
export const formatMinutes = (min: number) => `${min}m`;
export const formatPoints = (pts: number) => `${pts} pts`;
export const formatPercent = (pct: number) => `${pct}%`;

export const byPointsDesc = <T extends { points: number }>(a: T, b: T) => b.points - a.points;

export const rankLabel = (index: number) => (index < 3 ? ['🥇','🥈','🥉'][index] : `#${index + 1}`);
