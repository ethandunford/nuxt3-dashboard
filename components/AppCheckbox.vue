<script setup>
import { defineEmits } from "vue";

const emit = defineEmits(["update:modelValue"]);
const props = defineProps({
  placeholder: {
    type: String,
    required: true,
  },
  inputType: {
    type: String,
    required: true,
  },
  modelValue: {
    type: Boolean,
    default: false,
  },
});
</script>
<template>
  <input
    id="default-checkbox"
    type="checkbox"
    :checked="modelValue"
    class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-green-500 dark:focus:ring-green-500 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
    @change="emit('update:modelValue', $event.target.checked)"
  />
</template>
