<script setup lang="ts">
import { ref, computed } from 'vue'
import Anchor from './Anchor.vue'

export interface Props {
  author?: string
  citeHref?: string
  citeText?: string
}

const props = defineProps<Props>()
</script>

<style scoped>
blockquote {
  background: linear-gradient(to right, var(--color-alabaster) 0%, var(--color-gray-light) 100%);
  border: 0;
}

.quote {
  font-style: italic;
}
.quote::before {
  content: '“';
}
.quote::after {
  content: '”';
}

.author {
  font-style: normal;
}
</style>

<template>
  <blockquote :cite="citeHref">
    <slot name="quote"><p>Quote here</p></slot>
    <p v-if="author" class="author">—{{ author }}</p>
    <footer v-if="citeText && citeHref" class="important-mt-2">Source: <Anchor :href="`${citeHref}`" :text="`${citeText}`" /></footer>
    <footer v-else-if="citeText && !citeHref" class="important-mt-2">Source: <span>{{ citeText }}</span></footer>
  </blockquote>
</template>
