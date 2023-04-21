<script setup>
import { defineEmits } from "vue";

const emit = defineEmits(["update:modelValue"]);
const props = defineProps({
  placeholder: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  inputType: {
    type: String,
    required: true,
  },
});
</script>
<template>
  <input
    class="placeholder:italic placeholder:text-slate-400 block bg-white w-full border border-slate-300 rounded-md py-2 pl-2 shadow-sm focus:outline-none focus:border-sky-500 focus:ring-sky-500 focus:ring-1 sm:text-sm mb-1"
    :placeholder="props.placeholder"
    :type="props.inputType"
    :name="props.name"
    @input="emit('update:modelValue', $event.target.value)"
  />
</template>
