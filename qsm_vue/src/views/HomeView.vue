<script setup lang="ts">
import ContactHeadComponent from '@/components/ContactHeadComponent.vue';
import MainHeaderComponent from '@/components/MainHeaderComponent.vue';
import HeroComponent from '@/components/HeroComponent.vue';
import AboutComponent from '@/components/AboutComponent.vue'
import ServicesComponent from '@/components/ServicesComponent.vue'
import ProcessComponent from '@/components/ProcessComponent.vue'
import ChooseUsComponent from '@/components/ChooseUsComponent.vue'
// import ProjectsComponent from '@/components/ProjectsComponent.vue'
import BlogSectionComponent from '@/components/BlogSectionComponent.vue'
import FAQsComponent from '@/components/FAQsComponent.vue'
import AppointmentComponent from '@/components/AppointmentComponent.vue'

</script>

<template>
  <section class="page-body">
    <ContactHeadComponent />
    <MainHeaderComponent />
    <HeroComponent />
    <AboutComponent />
    <ServicesComponent />
    <ChooseUsComponent />
    <!-- <ProjectsComponent /> -->
    <ProcessComponent />
    <AppointmentComponent />
    <FAQsComponent />
    <BlogSectionComponent />

  </section>
</template>

<style scoped></style>
