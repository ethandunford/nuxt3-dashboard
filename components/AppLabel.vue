<script setup>
const props = defineProps({
  text: {
    type: String,
    required: true,
  },
});
</script>
<template>
  <label class="block mb-1">{{ props.text }}</label>
</template>
