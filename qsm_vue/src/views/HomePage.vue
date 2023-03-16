<template>
  <div>
    <ContactHeadComponent />
    <MainHeaderComponent />
    <section class="body-section">
      <HeroComponent />
      <AboutComponent />
      <ServicesComponent />
      <ChooseUsComponent />
      <!-- <ProjectsComponent /> -->
      <Vision_MissionComponent />
      <AppointmentComponent />
      <FAQsComponent />
      <BlogSectionComponent />
    </section>

    <FooterComponent />
  </div>
</template>


<script setup lang="ts">
import ContactHeadComponent from '@/components/HomePageComponents/ContactHeadComponent.vue';

import HeroComponent from '@/components/HomePageComponents/HeroComponent.vue';
import AboutComponent from '@/components/HomePageComponents/AboutComponent.vue'
import ServicesComponent from '@/components/HomePageComponents/ServicesComponent.vue'
import Vision_MissionComponent from '@/components/HomePageComponents/Vision&MissionComponent.vue'
import ChooseUsComponent from '@/components/HomePageComponents/ChooseUsComponent.vue'
// import ProjectsComponent from '@/components/ProjectsComponent.vue'
import BlogSectionComponent from '@/components/HomePageComponents/BlogSectionComponent.vue'
import FAQsComponent from '@/components/HomePageComponents/FAQsComponent.vue'
import AppointmentComponent from '@/components/HomePageComponents/AppointmentComponent.vue'


import { onMounted } from 'vue';
import { UsersAPI } from '@/store/functions/axiosManager';
const user_api = new UsersAPI()

onMounted(async () => {
  await user_api.visitor()
})
</script>
