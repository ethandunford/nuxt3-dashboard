<script setup>
import { ref, watch, computed } from "vue";
const route = useRoute();
const routeName = ref("index");

watch(
  () => route.name,
  () => {
    routeName.value = route.name;
  },
  { immediate: true }
);

const computedTitle = computed(() => {
  switch (routeName.value) {
    case "index":
      return "Home";
    case "edit-profile":
      return "Edit Profile";
    case "change-password":
      return "Change Password";
    case "manage-users":
      return "Manage Users";
    case "create-user":
      return "Create User";
    default:
      return "";
  }
});
</script>
<template>
  <h1 class="text-3xl mb-6 text-green-500 border-solid border-slate-200">
    {{ computedTitle }}
  </h1>
</template>
