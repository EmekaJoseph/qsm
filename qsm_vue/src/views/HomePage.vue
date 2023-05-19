<template>
  <div>

    <!-- Alert Modal START-->
    <div v-if="nextTraining" class="modal fade" data-bs-backdrop="static" id="trainingAlertModal" data-bs-keyboard="false"
      tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header border-0 bg-white">
            &nbsp;
            <span class="float-end">
              <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </span>
          </div>
          <div class="modal-body">
            <div class="content-text">
              <h5 class="text-muted">Upcoming training:</h5>
              <h4>{{ nextTraining ? nextTraining.title : '' }}</h4>
              <h5 v-if="nextTraining.daysToGo == 0" class="text-success">
                Today!
              </h5>

              <h5 v-else class="text-success">
                {{ nextTraining ? nextTraining.daysToGo : '' }}
                {{ nextTraining.daysToGo == 1 ? 'day' : 'days' }} to go!
              </h5>
              <div>
                <router-link @click="alertShown = '1'" class="btn btn-custom-secondary" :to="`${reglink()}`">Register
                  Now!</router-link>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
    <!-- Alert Modal END-->

    <button ref="openAlert" class="d-none" data-bs-toggle="modal" data-bs-target="#trainingAlertModal">Click</button>


    <ContactHeadComponent />
    <MainHeaderComponent />
    <section class="body-section">
      <HeroComponent />
      <AboutComponent />
      <ServicesComponent />
      <ChooseUsComponent />
      <!-- <ProjectsComponent /> -->
      <Vision_MissionComponent />
      <clientsComponent />
      <AppointmentComponent />
      <FAQsComponent />
      <BlogSectionComponent />
    </section>

    <whatsappChat />
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
// import ProjectsComponent from '@/components/HomePageComponents/ProjectsComponent.vue'
import BlogSectionComponent from '@/components/HomePageComponents/BlogSectionComponent.vue'
import FAQsComponent from '@/components/HomePageComponents/FAQsComponent.vue'
import AppointmentComponent from '@/components/HomePageComponents/AppointmentComponent.vue'
import clientsComponent from '@/components/HomePageComponents/clientsComponent.vue'

import { onMounted, ref } from 'vue';
import { UsersAPI, TrainingsAPI } from '@/store/functions/axiosManager';
import { onBeforeRouteLeave } from 'vue-router';
import { useStorage } from '@vueuse/core'


const user_api = new UsersAPI()
const training_api = new TrainingsAPI()

onMounted(() => {
  registerVisitor()
  getNextTraining()
})
async function registerVisitor() {
  await user_api.visitor()
}


const nextTraining = ref<any>({})
const alertShown = useStorage('trainAlertShown', '0', sessionStorage)
const btnX: any = ref(null)
const openAlert: any = ref(null)

const reglink = () => {
  return `/booktraining?trn=${nextTraining.value.id}`
}

async function getNextTraining() {
  let { data } = await training_api.nextComingTraining();
  nextTraining.value = data

  if (nextTraining.value) {
    if (alertShown.value == '0') {
      openAlert.value.click()
    }
  }

}

onBeforeRouteLeave(() => {
  btnX.value.click()
})
</script>

<style scoped>
.modal-body {
  display: flex;
  justify-content: center;
  text-align: center;
}
</style>

