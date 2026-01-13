export type LeaderEntry = {
  name: string;
  points: number;
};

export type ProfileStats = {
  weeklyCompliancePct: number; // 0..100
  zonesTreated: number;
  totalMinutes: number; // minutes
};

export type PersonalInfo = {
  id: string;
  phone: string;
  weightKg: number;
  heightM: number;
  gender: 'Masculino' | 'Femenino' | 'Otro';
};

export type PlanPriority = string;

export type Routine = {
  id: string;
  title: string;
  subtitle?: string;
  durationMin: number;
};
