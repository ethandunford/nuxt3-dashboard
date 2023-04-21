<script setup>
import { ref } from "vue";
definePageMeta({
  layout: "form-in-center",
});

const router = useRouter();
const email = ref("");
const password = ref("");
const disabled = ref(false);
const errors = ref({ email: "", password: "" });

function login() {
  let hasError = false;
  disabled.value = true;
  errors.value.email = "";
  errors.value.password = "";
  if (email.value === "") {
    errors.value.email = "email is required";
    hasError = true;
  }

  if (password.value === "") {
    errors.value.password = "password is required";
    hasError = true;
  }

  if (!hasError) {
    router.push("/");
  }

  disabled.value = false;
}
</script>
<template>
  <div>
    <h1 class="text-3xl mb-6 text-green-500 border-solid border-slate-200">
      Login
    </h1>
    <form @submit.prevent="login">
      <div class="mb-6">
        <app-label text="Email" />
        <app-input
          v-model="email"
          placeholder="Email"
          name="email"
          input-type="text"
        />
        <app-error :text="errors.email" />
      </div>
      <div class="mb-6">
        <app-label text="Password" />
        <app-input
          v-model="password"
          placeholder="Password"
          name="password"
          input-type="password"
        />
        <app-error :text="errors.password" />
      </div>
    </form>
    <div role="group">
      <AppButton text="Submit" :disabled="disabled" @click="login" />
      <RouterLink to="/password-reset">Forgot Password?</RouterLink>
    </div>
  </div>
</template>
