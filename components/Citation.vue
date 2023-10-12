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
  <blockquote class="box position-relative" :cite="citeHref">
    <div class="stack space:1em">
      <div>
        <slot name="quote"><p>Quote here</p></slot>
        <p v-if="author" class="author">—{{ author }}</p>
      </div>
      <div class="position-absolute top:half-space right:half-space">
        <QuotesSvg />
      </div>
      <footer v-if="citeText && citeHref" class="">Source: <Anchor :href="`${citeHref}`" :text="`${citeText}`" /></footer>
      <footer v-else-if="citeText && !citeHref" class="">Source: <span>{{ citeText }}</span></footer>
    </div>
  </blockquote>
</template>
