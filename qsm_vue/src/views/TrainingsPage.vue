<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">

      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">Up Coming</span>
                Trainings</h1>
            </div>

          </div>
        </div>
      </div>


      <div class="container py-2 mt-lg-3">

        <div v-if="trainings.list" class="text-center my-5">
          Lorem ipsum dolor sit amet consectetur adipisicing elit.
          Distinctio facilis reiciendis tenetur suscipit.
        </div>

        <div v-if="trainings.loading">
          <PageLoading />
        </div>

        <div v-else>

          <div style="min-height: 300px;" v-if="!trainings.list">
            <EmptyListComponent str="No Available Trainings" />
          </div>

          <div v-else class="row gy-4">
            <div v-for="(training, i) in trainings.list" :key="i" class="col-12 col-md-6 col-lg-6">
              <div class="card h-100 shadow">
                <div class="card-body">
                  <h5 class="card-title text-black shadow-sm p-3 position-relative">
                    <i class=" theme-color-faint bi bi-file-earmark-easel text-muted fs-2"></i>
                    {{ training.title }}
                    <!-- <span v-if="training.inCart" class="mt-2 pe-1 position-absolute top-0 start-100 translate-middle ">
                    <i class="bi bi-cart-check text-muted bg-light p-1 px-2 rounded-5 small"></i>
                  </span> -->
                  </h5>
                  <div class="card-text  ">
                    <ul class="list-group list-group-flush text-muted">
                      <li class="list-group-item text-muted small">
                        <i class="bi bi-geo-alt"></i> {{ training.venue }}
                      </li>
                      <li class="list-group-item text-muted small ">
                        <i class="bi bi-clock"></i> {{ training.start_date }}
                      </li>
                    </ul>
                  </div>
                  <div class="card-footer bg-transparent border-0 mt-2">
                    <button v-if="!training.inCart" @click="training.inCart = !training.inCart"
                      class="float-end btn btn-custom-secondary rounded-3 btn-sm ">
                      <i class="bi bi-cart-plus"></i> add to Cart
                    </button>

                    <button v-else @click="training.inCart = !training.inCart"
                      class="float-end btn btn-danger bg-danger-subtle text-dark rounded-3 btn-sm px-3">
                      <i class="bi bi-cart-x"></i> Remove
                    </button>
                    <button @click="trainings.detailsShow = training" data-bs-toggle="modal"
                      data-bs-target="#trainingDetailsModal"
                      class="float-end btn btn-custom-light rounded-3 me-3 btn-sm px-3">
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
      <div data-bs-toggle="modal" data-bs-target="#cartModal" class="justify-content-end sharePanel">
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
    <trainingDetailsModal />
    <FooterComponent />
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'
import { useTrainings } from '@/store/trainings'
import trainingDetailsModal from '@/components/Modals/trainingDetailsModal.vue';
import cartModal from '@/components/Modals/cartModal.vue';

const trainings = useTrainings()

onMounted(() => {
  window.scrollTo(0, 0);
  trainings.getList()
})

</script>

<style scoped>
.fixed-bottom-btn {
  position: fixed;
  bottom: 0;
  right: 0;

}


.sharePanel {
  margin-bottom: 250px;
  padding-right: 50px;
  display: flex;
  z-index: 999;
  position: relative;
  transition: all ease-in-out 0.4s;
}

@media screen and (max-width: 767px) {
  .sharePanel {
    padding-right: 20px;
  }

}

.sharePanel>a {
  font-size: 18px;
  /* background: #05a19c4b; */
  background-color: #f3efef;
  /* background-color: var(--bs-success-bg-subtle); */
  /* color: var(--theme-main3); */
  color: #111;
  padding: 12px 16px;
  border-radius: 100%;
  border: 1px solid #747373;
  /* border-color: red; */
}


@media (max-width: 994px) {
  .card-title {
    font-size: 16px !important;
  }

  .sharePanel {
    margin-bottom: 80px;
  }
}
</style>
