<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">

      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">QSM</span>
                Trainings</h1>
            </div>

          </div>
        </div>
      </div>


      <div class="container py-2 mt-lg-3 min-vh-100">

        <div v-if="trainings.list.length" class="text-center mb-5">
          <span class="fw-bold"> Register for a Training,</span> <br> You can register for more than a training by
          simply adding them to
          cart.
        </div>

        <div class="my-5" v-if="trainings.loading">
          <PageLoading />
        </div>

        <div v-else>

          <div class="py-5" style="min-height: 300px;" v-if="!trainings.list.length">
            <EmptyListComponent str="No Available Trainings" />
          </div>

          <div v-else class="row gy-4">
            <div v-for="(training, i) in trainings.list" :key="i" class="col-12 col-md-6 col-lg-4">
              <div class="card h-100 shadow rounded-4">
                <div class="card-body">
                  <h5 style="cursor: pointer;" @click="gotoTrainingPage(training.id)"
                    class="card-title text-black shadow-sm p-3 ">
                    <i class=" theme-color-faint bi bi-file-earmark-easel text-muted fs-2"></i>
                    {{ training.title }}
                  </h5>
                  <div class="card-text ">
                    <ul class="list-group list-group-flush text-muted">

                      <li class="list-group-item text-muted  ">
                        <i class="bi bi-calendar"></i>
                        {{ (new Date(training.start_date)).toDateString() }} -
                        {{ (new Date(training.end_date)).toDateString() }}
                      </li>
                      <li class="list-group-item text-muted ">
                        <i class="bi bi-geo-alt"></i> {{ training.venue }}
                      </li>
                    </ul>
                  </div>
                  <div class="card-footer bg-transparent border-0 mt-2">
                    <button v-if="!training.inCart" @click="training.inCart = !training.inCart"
                      class="float-end btn btn-custom-secondary rounded-3 btn-sm xsmall">
                      <i class="bi bi-cart-plus"></i> add to Cart
                    </button>

                    <button v-else @click="training.inCart = !training.inCart"
                      class="float-end btn btn-danger bg-danger-subtle text-dark rounded-3 btn-sm px-3 xsmall">
                      <i class="bi bi-cart-x"></i> Remove
                    </button>
                    <button @click="gotoTrainingPage(training.id)"
                      class="float-end btn btn-custom-light rounded-3 me-3 btn-sm px-3 xsmall">
                      <i class="bi bi-list"></i> details
                    </button>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <div v-if="trainings.cart.length" class="fixed-bottom-btn">
      <div data-bs-toggle="modal" data-bs-target="#cartModal" class="justify-content-end floatPanel">
        <a @click.prevent="" href="#"
          class="position-relative shadow animate__heartBeat animate__infinite animate__slower">
          <i class="bi bi-cart3"></i>
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success fw-light">
            {{ trainings.cart.length }}
            <span class="visually-hidden"></span>
          </span>
        </a>

      </div>
    </div>

    <cartModal />
    <FooterComponent />
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'
import { useTrainings } from '@/store/trainings'
import cartModal from '@/components/Modals/cartModal.vue';
import { useRouter } from 'vue-router';

const trainings = useTrainings()
const router = useRouter()

onMounted(() => {
  window.scrollTo(0, 0);
  trainings.getList()
})

function gotoTrainingPage(id: any) {
  router.push({
    path: '/booktraining',
    query: {
      trn: id
    }
  })
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
