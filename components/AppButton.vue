<script setup>
const props = defineProps({
  text: {
    type: String,
    required: true,
  },
  disabled: {
    type: Boolean,
    required: false,
    default: false,
  },
});
</script>
<template>
  <button
    :disabled="disabled"
    type="button"
    class="inline-flex items-center px-4 py-2 mr-4 text-sm font-medium text-gray-900 border border-green-500 hover:bg-white focus:z-10 focus:ring-2 focus:ring-gray-500 focus:bg-white-900 focus:text-white dark:border-white dark:text-white dark:hover:text-white dark:hover:bg-gray-700 dark:focus:bg-gray-700 text-white hover:text-green-500 bg-green-500"
  >
    {{ props.text }}
  </button>
</template>
