import type { Routine } from '../types';

export const getSuggestedRoutines = (): Routine[] => [
  { id: 'ankle-feet', title: 'Alivia tus TOBILLOS / PIES', durationMin: 15 },
  { id: 'lower-back', title: 'Alivia tu ESPALDA BAJA', durationMin: 15 },
];

export const getExploreTags = (): string[] => ['Molestias', 'Tensión', 'Hinchazón'];
