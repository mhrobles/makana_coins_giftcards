import type { UserProfile } from '../types/user';
import userProfileJson from '../../../params/user_profile.json';

export const getUserProfile = (): UserProfile => userProfileJson as UserProfile;
