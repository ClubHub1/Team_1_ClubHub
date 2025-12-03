import { api } from './api'

export interface Organization {
  id: number
  name: string
  role: string | null
  is_active: boolean
  dues_paid: boolean
}

export interface User {
  id: number
  email: string
  first_name: string
  last_name: string
  role: string
  created_at: string
}

export interface AuthResponse {
  token: string
  user: User
  organizations: Organization[]
}

//LOGIN

export async function login(email: string, password: string): Promise<AuthResponse> {
  const response = await api.post<AuthResponse>('/auth/login', {
    email,
    password,
  })

  return response.data
}

//REGISTER

export interface RegisterPayload {
  email: string
  password: string
  first_name: string
  last_name: string
  role?: string // optional; backend defaults to 'student' if missing
}

export async function register(payload: RegisterPayload): Promise<AuthResponse> {
  const response = await api.post<AuthResponse>('/auth/register', payload)
  return response.data
}
