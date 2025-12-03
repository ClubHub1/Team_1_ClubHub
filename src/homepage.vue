<script setup lang="ts">
import { ref } from 'vue'
import Icon from './components/icon.vue'
import { login } from './services/auth'

// When the ClubHub icon is clicked (can be wired later to navigate home)
function iconClicked() {
  // Future implementation: navigate back to homepage
}

// Links used in the footer (and could also be used in a header)
const links = ['Home', 'About Us', 'Team', 'Services', 'Contact Us']

// ----- Login form state -----
const email = ref('')
const password = ref('')
const loading = ref(false)
const error = ref('')

// ----- Logged-in user + organizations -----
const loggedInUser = ref<null | {
  first_name: string
  last_name: string
  role: string
}>(null)

const organizations = ref<{ id: number; name: string }[]>([])
const selectedOrgId = ref<number | null>(null)

// ----- Login handler -----
async function handleLogin() {
  error.value = ''
  loading.value = true

  try {
    const data = await login(email.value, password.value)

    // Save minimal user info
    loggedInUser.value = {
      first_name: data.user.first_name,
      last_name: data.user.last_name,
      role: data.user.role,
    }

    // Save organizations from backend
    organizations.value = data.organizations
    selectedOrgId.value = data.organizations.length
      ? data.organizations[0].id
      : null

    // Optional: persist in localStorage for later pages
    // localStorage.setItem('user', JSON.stringify(data.user))
    // localStorage.setItem('organizations', JSON.stringify(data.organizations))
  } catch (e: any) {
    error.value =
      e?.response?.data?.message || 'Login failed. Please check your email and password.'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <v-app>
    <!-- Top App Bar -->
    <v-app-bar app color="primary" density="comfortable">
      <v-btn icon @click="iconClicked">
        <Icon />
      </v-btn>

      <v-toolbar-title class="ml-2 text-h6">ClubHub</v-toolbar-title>

      <v-spacer />

      <!-- Example header links (optional) -->
      <v-btn
        v-for="link in links"
        :key="link"
        variant="text"
        rounded
        class="mx-1"
      >
        {{ link }}
      </v-btn>
    </v-app-bar>

    <!-- Main content -->
    <v-main>
      <v-container class="py-12">
        <v-row align="center" justify="center">
          <!-- Left side: hero text / description -->
          <v-col cols="12" md="7">
            <h1 class="text-h3 font-weight-bold mb-4">
              Welcome to ClubHub
            </h1>
            <p class="text-body-1 mb-4">
              Manage your student organizations in one place — track members, events, budgets,
              and more. Sign in with your university account to access your clubs.
            </p>
            <p class="text-body-2">
              After logging in, you’ll be able to choose which organization to view and access
              features based on your role (Member, Officer, or President).
            </p>
          </v-col>

          <!-- Right side: Login card -->
          <v-col cols="12" md="5">
            <v-card elevation="8" class="pa-6">
              <v-card-title class="text-h5 text-center mb-2">
                Sign in to ClubHub
              </v-card-title>
              <v-card-subtitle class="text-center mb-4">
                Use your school email and password.
              </v-card-subtitle>

              <v-form @submit.prevent="handleLogin">
                <v-text-field
                  v-model="email"
                  label="School Email"
                  type="email"
                  required
                  prepend-inner-icon="mdi-email"
                  class="mb-3"
                />

                <v-text-field
                  v-model="password"
                  label="Password"
                  type="password"
                  required
                  prepend-inner-icon="mdi-lock"
                  class="mb-4"
                />

                <v-alert
                  v-if="error"
                  type="error"
                  variant="tonal"
                  class="mb-4"
                >
                  {{ error }}
                </v-alert>

                <v-btn
                  type="submit"
                  :loading="loading"
                  block
                  color="primary"
                >
                  Sign In
                </v-btn>
              </v-form>

              <!-- After successful login -->
              <v-divider class="my-6" v-if="loggedInUser" />

              <div v-if="loggedInUser">
                <div class="mb-4">
                  <div class="text-subtitle-1">
                    Welcome,
                    {{ loggedInUser.first_name }} {{ loggedInUser.last_name }}
                    ({{ loggedInUser.role }})
                  </div>
                  <div class="text-body-2">
                    Select which organization you want to manage:
                  </div>
                </div>

                <v-select
                  v-model="selectedOrgId"
                  :items="organizations"
                  item-title="name"
                  item-value="id"
                  label="Select an organization"
                  class="mb-4"
                />

                <v-alert
                  v-if="selectedOrgId"
                  type="info"
                  variant="tonal"
                >
                  You are viewing organization ID: {{ selectedOrgId }}.
                  <!-- Later you can navigate to an org dashboard here. -->
                </v-alert>
              </div>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>

    <!-- Footer -->
    <v-footer app color="grey-lighten-4" class="pa-4">
      <v-row class="w-100" align="center" justify="center">
        <v-col cols="12" class="text-center mb-2">
          <v-btn
            v-for="link in links"
            :key="link"
            variant="text"
            rounded
            class="mx-1"
          >
            {{ link }}
          </v-btn>
        </v-col>

        <v-col cols="12" class="text-center">
          {{ new Date().getFullYear() }} — <strong>ClubHub</strong>
        </v-col>
      </v-row>
    </v-footer>
  </v-app>
</template>

<style scoped>
/* You can customize homepage styling here if needed */
</style>
