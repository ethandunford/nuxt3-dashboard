<script setup>
import { ref, computed } from "vue";
import AvatarImage from "../assets/images/eu.ui-avatars.png";

definePageMeta({
  layout: "admin",
});

const image = ref(null);
const email = ref("");
const password = ref("");
const passwordConfirm = ref("");
const disabled = ref(false);
const success = ref(false);

const error = ref({
  image: "",
  email: "",
  password: "",
  passwordConfirm: "",
});

const displayAvatar = computed(() => {
  return image.value === null ? AvatarImage : URL.createObjectURL(image.value);
});

const handleImage = (event) => {
  error.value.image = "";
  if (["image/jpeg", "image/png"].includes(event.target.files[0].type)) {
    image.value = event.target.files[0];
    return;
  }

  error.value.image = "image format invalid";
};

const validate = () => {
  const errors = {};
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

  image.value = null;
  email.value = "";
  password.value = "";
  passwordConfirm.value = "";
  disabled.value = false;
  success.value = true;
};
</script>
<template>
  <img :src="displayAvatar" class="rounded mb-4 avatar" />
  <form>
    <div class="mb-6">
      <app-label v-if="image" text="Remove image" @click="image = null" />
      <app-label v-if="!image" text="Upload new image" />
      <app-file
        placeholder="Password"
        name="password"
        input-type="password"
        @file-change="handleImage($event)"
      />
      <app-error :text="error.image" />
    </div>
    <div class="mb-6">
      <app-label text="Email" />
      <app-input
        v-model="email"
        placeholder="Email"
        name="email"
        input-type="email"
      />
      <app-error :text="error.email" />
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
  <AppButton text="Save" :disabled="disabled" @click="submit()" />
  <p v-if="success" class="text-green-500 my-4">
    Your details has been updated
  </p>
</template>
<style>
.avatar {
  width: 120px;
  height: 120px;
}
</style>
