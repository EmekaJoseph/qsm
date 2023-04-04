<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">

      <!-- <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">QSM</span>
                Trainings</h1>
            </div>

          </div>
        </div>
      </div> -->


      <div class="container py-2 mt-lg-3 min-vh-100">

        <div class="my-5" v-if="pageLoading">
          <PageLoading />
        </div>

        <div v-else class="row gy-4 mt-2">
          <h5 class="text-center text-muted2 mb-4">Book Training:</h5>
          <div v-if="training.image" class="col-md-5">
            <img class="img-fluid" :src="`${hostURL}/trainings_images/${training.image}`" alt="QSM-Training">
          </div>
          <div class="col-md-7">
            <div class="fw-bold text-black text-uppercase fs-4">{{ training.title }}</div>
            <div v-html="training.info"></div>
            <div class="mt-3 small text-muted">
              <i class="bi bi-calendar"></i>
              {{ (new Date(training.start_date)).toDateString() }} -
              {{ (new Date(training.end_date)).toDateString() }}
            </div>
            <div class="text-muted mt-2 small"><i class="bi bi-geo-alt"></i> {{ training.venue }}</div>


            <div class="row g-3 mt-5">
              <div class="col-md-5">
                <button data-bs-toggle="modal" data-bs-target="#instantBooking" class="btn theme-btn w-100">Book
                  now</button>
              </div>
              <div class="col-md-3">
                <router-link class="btn btn-custom-light w-100" to="/trainings">Other trainings</router-link>
              </div>
            </div>
          </div>
        </div>


      </div>
    </section>

    <instantBooking :item="training" />
    <FooterComponent />
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import instantBooking from '@/components/Modals/instantBooking.vue';
import { useRoute, useRouter } from 'vue-router';
import { TrainingsAPI, hostURL } from '@/store/functions/axiosManager';

const route = useRoute()
const router = useRouter()
const training_api = new TrainingsAPI()
const pageLoading = ref(false)

const training = ref<any>({})

onMounted(() => {
  window.scrollTo(0, 0);
  pageLoading.value = true
  getTrainingDetails()
})



async function getTrainingDetails() {
  let id: any = route.query.trn
  let resp = await training_api.details(id)
  if (resp.status == 203) {
    router.replace({
      path: `/trainings`,
    })
    pageLoading.value = false
  }
  else {
    training.value = resp.data
    pageLoading.value = false
  }
}

</script>

<style scoped>
.fixed-bottom-btn {
  position: fixed;
  bottom: 0;
  right: 0;

}


.floatPanel {
  margin-bottom: 480px;
  padding-right: 50px;
  display: flex;
  z-index: 999;
  position: relative;
  transition: all ease-in-out 0.4s;
}

@media screen and (max-width: 767px) {
  .floatPanel {
    padding-right: 20px;
  }
}

.floatPanel>a {
  font-size: 24px;
  background-color: #f3efef;
  /* background-color: var(--bs-success-bg-subtle); */
  color: #111;
  padding: 6px 13px;
  border-radius: 100%;
  border: 1px solid #747373;
}

.floatPanel>a>span {
  font-size: 11px;
}


@media (max-width: 994px) {
  .card-title {
    font-size: 14px !important;
  }

  /* .floatPanel {
    margin-bottom: 80px;
  } */
}

.list-group-item {
  font-size: 12px;
  padding-block: 5px;
}
</style>
