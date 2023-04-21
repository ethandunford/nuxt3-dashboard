<script setup>
import { computed, onMounted } from "vue";
import NavLinks from "../components/NavLinks.vue";

const sidebarOpen = ref(null);
const route = useRoute();

const toggleSideBar = () => {
  sidebarOpen.value = !sidebarOpen.value;
};

const isMobile = () => {
  return (
    Math.max(
      document.documentElement.clientWidth || 0,
      window.innerWidth || 0
    ) <= 640
  );
};

const columnLayoutComputed = computed(() => {
  if (isMobile()) {
    return "w-full";
  }

  switch (route.name) {
    case "index":
      return "w-full";
    default:
      return "w-1/2";
  }
});

const mobileStyles = computed(() => {
  return sidebarOpen.value === true
    ? isMobile()
      ? "ml-64"
      : "sm:ml-64"
    : isMobile()
    ? "sm:ml-64"
    : "";
});

onMounted(() => {
  sidebarOpen.value = !isMobile();
  addEventListener("resize", () => {
    sidebarOpen.value = !isMobile();
  });
});
</script>
<template>
  <clientOnly>
    <aside
      id="sidebar-multi-level-sidebar"
      class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full"
      aria-label="Sidebar"
      :class="[mobileStyles]"
    >
      <div
        class="justify-between h-full px-3 py-4 overflow-y-auto bg-gray-50 dark:bg-gray-800"
      >
        <NavLinks />
      </div>
    </aside>
    <div :class="[mobileStyles]">
      <div class="p-5 flex items-center bg-green-500 dark:bg-gray-800">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-6 h-6 text-white transition duration-75 dark:text-green-500 hover:text-gray-500 dark:hover:text-white"
          @click="toggleSideBar"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M3.75 5.25h16.5m-16.5 4.5h16.5m-16.5 4.5h16.5m-16.5 4.5h16.5"
          />
        </svg>
        <h1 class="text-2xl ml-6 text-white dark:text-green-500">Dashboard</h1>
      </div>
      <div class="flex lg:ml-12 lg:mr-12 md:mt-12 p-12 shadow-lg">
        <div class="columns-1" :class="[columnLayoutComputed]">
          <PageTitle />
          <slot></slot>
        </div>
      </div>
    </div>
  </clientOnly>
</template>
