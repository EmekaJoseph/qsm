<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">


      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">Company's</span>
                Newsletters</h1>
              <div class="animate__animated animate__slideInLeft animate__delay-1s">Download our Newsletters</div>
            </div>

          </div>
        </div>
      </div>


      <div class="container py-5 animate__animated animate__fadeIn text-black">

        <div class="row">
          <div class="col-12  my-5">
            <span class="text-muted2 small" style="letter-spacing: 0.2rem;"> NEWSLETTERS</span>
            <div class="float-lg-end">
              <input type="text" class="form-control" v-model="searchField" placeholder="search..">
            </div>
          </div>

          <div class="col-12">
            <div class="row gy-3">
              <div v-for="{ id, title, doc, created } in listToshow" :key="id" class="col-sm-3">
                <div class="card shadow material-card">
                  <div class="card-body pb-0">

                    <div>
                      <div class="title fw-bold text-capitalize small">
                        <!-- - {{ fxn.truncateStr(name, 45) }} -->
                        <i class="bi bi-newspaper"></i> {{ title }}
                      </div>
                    </div>

                    <div class="info">
                      <span class="xsmall text-muted2">
                        uploaded {{ created }}
                      </span>
                    </div>
                  </div>
                  <div class="card-footer border-0 bg-transparent pb-3">
                    <a @click="registerDownload(id)"
                      class="float-end btn btn-sm xsmall btn-custom-secondary rounded-2 fs-11 hover-tiltY"
                      :href="`${hostURL}/course_materials/${doc}`" download>
                      <i class="bi bi-cloud-download"></i> download
                    </a>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <whatsappChat />
    <FooterComponent />
  </div>
</template>



<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue'
import { NewsLetterAPI, hostURL } from '@/store/functions/axiosManager';


const _api = new NewsLetterAPI()
const List = ref<any[]>([])
const searchField = ref<string>('')

onMounted(() => {
  getList()
})

async function getList() {
  let { data } = await _api.list()
  List.value = data
}

async function registerDownload(id: string) {
  await _api.downloadNewsLetter(id)
}


const listToshow = computed(() => {
  if (List.value.length > 0) {
    return searchField.value === ""
      ? List.value
      : List.value.filter((wo: any) => (<any>Object).values(wo).join("").toLocaleLowerCase().indexOf(searchField.value.toLocaleLowerCase()) !== -1);
  }
  else {
    return List.value
  }
})


let interval = setInterval(() => {
  getList()
}, 10000)

onUnmounted(() => {
  clearInterval(interval)
})

</script>

<style scoped>
.material-card {
  height: 100%;
  /* border-left: 2px solid #9e2a07; */
  border-radius: 10px;
}
</style>
