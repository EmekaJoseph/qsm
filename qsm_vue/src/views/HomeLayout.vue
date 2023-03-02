<script setup lang="ts">
import { RouterView } from 'vue-router'
import { useWindowScroll } from '@vueuse/core'
import FooterComponent from '@/components/FooterComponent.vue';

const { y } = useWindowScroll()


</script>

<template>
    <!-- <headerVue :scrolled="y" /> -->
    <RouterView />

    <FooterComponent />
</template>

<style scoped></style>
