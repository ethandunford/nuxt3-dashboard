<script setup>
import { ref } from "vue";

definePageMeta({
  layout: "admin",
});

const firstName = ref("");
const lastName = ref("");
const email = ref("");
const password = ref("");
const passwordConfirm = ref("");
const isSuperUser = ref(false);
const disabled = ref(false);
const success = ref(false);

const error = ref({
  firstName: "",
  lastName: "",
  email: "",
  password: "",
  passwordConfirm: "",
});

const validate = () => {
  const errors = {};
  if (firstName.value === "") {
    errors.firstName = "firstname is required";
  }

  if (lastName.value === "") {
    errors.lastName = "lastname is required";
  }
  if (email.value === "") {
    errors.email = "email is required";
  }

  if (password.value === "") {
    errors.password = "password is required";
  }

  if (passwordConfirm.value === "") {
    errors.passwordConfirm = "confirmation password is required";
  }

  if (passwordConfirm.value !== password.value) {
    errors.passwordConfirm = "confirmation password doesn't match";
  }

  return errors;
};

const clearErrors = () => {
  Object.keys(error.value).forEach((k) => {
    error.value[k] = "";
  });
};

const submit = () => {
  success.value = false;
  disabled.value = true;

  clearErrors();

  const e = validate();
  if (Object.keys(e).length > 0) {
    error.value = e;
    disabled.value = false;
    return;
  }

  email.value = "";
  password.value = "";
  passwordConfirm.value = "";
  disabled.value = false;
  success.value = true;
};
</script>
<template>
  <form>
    <div class="mb-6">
      <app-label text="Firstname" />
      <app-input
        v-model="firstName"
        placeholder="Firstname"
        name="firstname"
        input-type="text"
      />
      <app-error :text="error.firstName" />
    </div>
    <div class="mb-6">
      <app-label text="Lastname" />
      <app-input
        v-model="lastName"
        placeholder="Lastname"
        name="lastname"
        input-type="text"
      />
      <app-error :text="error.lastName" />
    </div>
    <div class="mb-6">
      <app-label text="Email" />
      <app-input
        v-model="email"
        placeholder="Email"
        name="email"
        input-type="text"
      />
      <app-error :text="error.email" />
    </div>
    <div class="mb-6">
      <div class="checkbox-wrap">
        <app-checkbox
          v-model="isSuperUser"
          placeholder="Password"
          name="password"
          input-type="password"
          type="checkbox"
        />
        <app-label text="User is superuser (currently is not a superuser)" />
      </div>
    </div>
    <div class="mb-6">
      <div class="checkbox-wrap">
        <app-checkbox
          v-model="isSuperUser"
          placeholder="Password"
          name="password"
          input-type="password"
          type="checkbox"
        />
        <app-label text="User is Active (currently is active)" />
      </div>
    </div>
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
    <div class="mb-6">
      <app-label text="Confirm Password" />
      <app-input
        v-model="passwordConfirm"
        placeholder="Confirm password"
        name="passwordConfirm"
        input-type="password"
      />
      <app-error :text="error.passwordConfirm" />
    </div>
  </form>
  <AppButton text="Save" :disabled="disabled" @click="submit" />
  <p v-if="success" class="text-green-500 my-4">User account created</p>
</template>
<style>
.checkbox-wrap {
  display: flex;
  align-items: center;
}

.checkbox-wrap input {
  margin-right: 0.5rem;
}
</style>
