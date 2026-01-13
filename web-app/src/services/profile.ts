import type { PersonalInfo, PlanPriority, ProfileStats } from '../types';

export const getProfileStats = (): ProfileStats => ({
  weeklyCompliancePct: 66,
  zonesTreated: 7,
  totalMinutes: 51,
});

export const getPersonalInfo = (): PersonalInfo => ({
  id: '19638444-8',
  phone: '+56991712991',
  weightKg: 65.0,
  heightM: 1.75,
  gender: 'Masculino',
});

export const getPlanPriorities = (): PlanPriority[] => ['MUÑECA / MANO', 'PIERNAS / GLÚTEOS'];
