<script setup lang="ts">
  import Icon from './components/icon.vue'
  function iconClicked() {
    //Future implementation will direct user back to homepage when CH logo is clicked
    
  }
  const links = [
    'Home',
    'About Us',
    'Team',
    'Services',
    'Contact Us',
  ]
</script>

Rules for Form Inputs
<script lang="ts">
  export default {
    data: () => ({
      valid: false,
      password: '',
      passwordRules: [
        value => {
          if (value) return true

          return 'Password is required.'
        },
      ],
      email: '',
      emailRules: [
        value => {
          if (value) return true

          return 'E-mail is required.'
        },
        value => {
          if (/.+@.+\..+/.test(value)) return true

          return 'E-mail must be valid.'
        },
      ],
    }),
  }
</script>

<template>
  <v-app>
    <v-main>

      <v-container>
        <v-row justify="center">
          <v-column >
            <v-card class = "bg-primary mt-10" height="500" width="400">
              <v-card-title class="ml-3 mt-3 mb-10">
                <h1>Welcome <br/>
                Back.</h1>
              </v-card-title>
            </v-card>
          </v-column>
          <v-column>
            <v-card class = "mt-10" height="500" width="400" text>

              <v-card-title class="text-center">
                <h1>Sign In</h1>
              </v-card-title>

              <v-container class="ml-3">
                <v-form v-model="valid" class="mt-7">

                  <v-row
                  >
                    <v-text-field
                      v-model="email"
                      :rules="emailRules"
                      label="E-mail"
                      required
                      class="mr-6 mb-5"
                    ></v-text-field>
                  </v-row>

                  <v-row>
                      <v-text-field
                        v-model="password"
                        :rules="passwordRules"
                        label="Password"
                        required
                        class="mr-6"
                      ></v-text-field>
                  </v-row>

                  <v-row class="justify-center">
                    <v-btn 
                      type="submit"
                      class="mt-7 bg-primary"
                      width="100"
                    >
                      Login
                    </v-btn>
                  </v-row>

                  <v-row class="justify-center mt-6">
                    <p>Don't have an account? <router-link to="/register">Register Here!</router-link> </p>
                  </v-row>

                </v-form>
              </v-container>
            </v-card>
          </v-column>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>