<script setup lang="ts">
import { ref, computed } from 'vue'
import { isFosdem, isGitHub, isReddit, isRust, isTwitter, isYouTube, isZig } from "./utils.js"

export interface Props {
  alt?: string
  href: string
  text: string
}

const props = withDefaults(defineProps<Props>(), {
    alt: 'Link alt text'
})

const alt = ref(props.alt)
const href = ref(props.href)

let icon_type = ''
if (isFosdem(href.value)) {
  icon_type = 'fosdem'
} else if (isGitHub(href.value)) {
  icon_type = 'github'
} else if (isReddit(href.value)) {
  icon_type = 'reddit'
} else if (isRust(href.value)) {
  icon_type = 'rust'
} else if (isTwitter(href.value)) {
  icon_type = 'twitter'
} else if (isYouTube(href.value)) {
  icon_type = 'youtube'
} else if (isZig(href.value)) {
  icon_type = 'zig'
}else {
  icon_type = 'default'
}

const classObject = computed(() => ({
  fosdem: isFosdem(href.value),
  github: isGitHub(href.value),
  link: true,
  reddit: isReddit(href.value),
  rust: isRust(href.value),
  twitter: isTwitter(href.value),
  youtube: isYouTube(href.value),
  zig: isZig(href.value),
}))
</script>

<style scoped>
.link {
  border-width: 0;
  text-decoration: underline;
  text-decoration-color: var(--primary-color);
  text-decoration-style: dashed;
  text-underline-offset: 0.35em;
}

.link:hover {
  color: var(--primary-color);
  text-decoration-style: solid;
}

.link svg {
  color: var(--primary-color);
  display: inline;
}
</style>

<template>
  <a :href="href" target="_blank" rel="noopener" :alt="alt"
     :class="classObject">
    {{ text }} 
    <FosdemLogo v-if="icon_type === 'fosdem'" />
    <carbon:logo-github v-else-if="icon_type === 'github'" />
    <uim-reddit-alien-alt v-else-if="icon_type === 'reddit'" />
    <RustLogo v-else-if="icon_type === 'rust'" />
    <carbon:logo-twitter v-else-if="icon_type === 'twitter'" />
    <carbon:logo-youtube v-else-if="icon_type === 'youtube'" />
    <ZigLogo v-else-if="icon_type === 'zig'" />
    <carbon:link v-else />
  </a>
</template>
