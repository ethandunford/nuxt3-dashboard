<script setup>
const props = defineProps({
  text: {
    type: String,
    required: true,
  },
});
</script>
<template>
  <p v-if="props.text" class="text-red-500 duration-75">{{ props.text }}</p>
</template>
