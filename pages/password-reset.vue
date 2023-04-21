<script setup>
import { ref } from "vue";

definePageMeta({
  layout: "form-in-center",
});

const email = ref("");
const disabled = ref(false);
const emailError = ref("");
const success = ref(false);

function submitReset() {
  success.value = false;
  disabled.value = true;
  emailError.value = "";
  if (email.value === "") {
    emailError.value = "email is required";
  }

  if (!emailError.value) {
    success.value = true;
    email.value = "";
  }

  disabled.value = false;
}
</script>
<template>
  <div>
    <h1 class="text-3xl mb-6 text-green-500 border-solid border-slate-200">
      Password Reset
    </h1>
    <form>
      <div class="mb-6">
        <div class="mb-6">
          <app-label text="Email" />
          <app-input
            v-model="email"
            placeholder="Email"
            name="email"
            input-type="text"
          />
          <app-error :text="emailError" />
          <p v-if="success" class="text-green-500">
            A password reset email has been sent
          </p>
        </div>
      </div>
    </form>
    <div>
      <AppButton text="Submit" @click="submitReset" />
      <RouterLink to="/login">
        <AppButton text="Back" />
      </RouterLink>
    </div>
  </div>
</template>
