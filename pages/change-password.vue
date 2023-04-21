<script setup>
import { ref } from "vue";
definePageMeta({
  layout: "admin",
});

const password = ref("");
const passwordConfirm = ref("");
const disabled = ref(false);
const success = ref(false);
const error = ref({ password: "", passwordConfirm: "" });

const validate = () => {
  const errors = {};
  if (password.value === "") {
    errors.password = "password is required";
  }

  if (passwordConfirm.value === "") {
    errors.passwordConfirm = "password is required";
  }

  if (passwordConfirm.value !== password.value) {
    errors.passwordConfirm = "confirmation password doesn't match";
  }

  return errors;
};

const updatePassword = () => {
  disabled.value = true;
  success.value = false;
  error.value.password = "";
  error.value.passwordConfirm = "";

  const e = validate();
  if (Object.keys(e).length > 0) {
    error.value = e;
    disabled.value = false;
    return;
  }

  success.value = true;
  password.value = "";
  passwordConfirm.value = "";
  disabled.value = false;
};
</script>
<template>
  <form>
    <div class="mb-6">
      <div class="mb-6">
        <app-label text="Password" />
        <app-input
          v-model="password"
          placeholder="Password"
          name="password"
          input-type="password"
        />
        <app-error :text="error.password" />
      </div>
    </div>
    <div class="mb-6">
      <app-label text="Confirm Password" />
      <app-input
        v-model="passwordConfirm"
        placeholder="Confirm Password"
        name="password-confirmed"
        input-type="password"
      />
      <app-error :text="error.passwordConfirm" />
    </div>
  </form>
  <AppButton text="Save" :disabled="disabled" @click="updatePassword" />
  <p v-if="success" class="text-green-500 mb-4">
    Your password has been updated
  </p>
</template>
