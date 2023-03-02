<script setup lang="ts">
import HeroComponent from '@/components/HeroComponent.vue';
import AboutComponent from '@/components/AboutComponent.vue'
import ServicesComponent from '@/components/ServicesComponent.vue'
import ProcessComponent from '@/components/ProcessComponent.vue'
import ChooseUsComponent from '@/components/ChooseUsComponent.vue'
import ProjectsComponent from '@/components/ProjectsComponent.vue'
import BlogSectionComponent from '@/components/BlogSectionComponent.vue'
import FAQsComponent from '@/components/FAQsComponent.vue'
import AppointmentComponent from '@/components/AppointmentComponent.vue'

</script>

<template>
  <section class="page-body">
    <HeroComponent />
    <AboutComponent />
    <ServicesComponent />
    <ChooseUsComponent />
    <AppointmentComponent />
    <ProjectsComponent />
    <ProcessComponent />
    <FAQsComponent />
    <BlogSectionComponent />

  </section>
</template>

<style scoped></style>
