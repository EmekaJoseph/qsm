
<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">

      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">Course</span>
                Materials</h1>
            </div>
          </div>
        </div>
      </div>



      <div class="container py-5 animate__animated animate__fadeIn text-black min-vh-100">

        <div class="text-center mb-lg-5">
          <span class="fw-bold fs-"> Download Materials,</span> <br>
          Please <router-link class="btn btn-link text-success p-0" :to="{ path: '/', hash: '#instantform' }">contact
            us</router-link> for your
          One-Time-Code to download.
        </div>

        <div class="py-5" v-if="materials.loading">
          <PageLoading />
        </div>


        <div v-else>
        <!-- <div class="py-5" style="min-height: 300px;" v-if="!materials.list.length">
            <EmptyListComponent str="No Materials" />
                                                                                                                                                                          </div> -->

          <div class="row gy-3">
            <div class="col-md-8">
              <div class="col-md-8">
                <SearchMaterialField @submit="searchByName" />
              </div>

              <div class="row gy-3 mt-sm-3">
                <div v-show="!materials.searchLoading" class="col-12 text-muted2 mb-sm-2 small"
                  style="letter-spacing: 0.2rem;">
                  {{ materials.list.length ? listGroupName : 'NO MATERIALS' }}
                </div>
                <div class="py-5" v-if="materials.searchLoading">
                  <PageLoading />
                </div>
                <div v-else v-for="matr in materials.list" :key="matr" class="col-12 col-sm-6" @click="toDownload = matr"
                  data-bs-toggle="modal" data-bs-target="#downloadMaterialModal">
                  <div class="card rounded-0 shadow-sm material-card">
                    <div class="d-flex">
                      <div class="col-2 icon-left">
                        <i class="bi bi-file-earmark-lock"></i>
                      </div>
                      <div class="col-10 details-right">
                        <div class="title">
                          {{ matr.name }} <small>({{ matr.material_code }})</small>
                        </div>
                        <div class="info">
                          <div class="category text-success mb-1">
                            <i class="bi bi-tag"></i> {{ matr.category }}
                          </div>
                          {{ matr.pages }} pages <span class="float-end">
                            <button class="btn btn-sm btn-custom-light rounded-4 fs-11 hover-tiltY">
                              <i class="bi bi-download"></i> download
                            </button>
                          </span>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>

            <!-- Categories area -->
            <div class="col-md-4">
              <div class="row gy-5">
                <div class="col-12" v-if="materials.categories.length">
                  <div class="card rounded-0 border-top-0 border-end-0 border-bottom-0 border-light shadow-sm">
                    <div class="card-body">
                      <div class="card-header bg-transparent fw-bold border-0">Categories:</div>
                      <ul class="list-group list-group-flush">

                        <li @click="searchByLatest()" class="list-group-item cate-list-item hover-tiltX"
                          :class="{ 'theme-color': categoryToSearch == 'All' }">
                          All (Latest)
                        </li>

                        <li @click="searchByCategory(li)" v-for="li in materials.categories" :key="li"
                          class="list-group-item cate-list-item hover-tiltX"
                          :class="{ 'theme-color': categoryToSearch == li.category_name }">
                          {{ li.category_name }}
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>

                <div class="newsletter">
                  <newsLetterForm />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <downloadMaterialModal :item="toDownload" />
    <FooterComponent />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import SearchMaterialField from '@/components/SearchMaterialField.vue';
import { useCourseMaterials } from '@/store/materials';
import downloadMaterialModal from '@/components/Modals/downloadMaterialModal.vue';
import newsLetterForm from '@/components/newsLetterForm.vue';




onMounted(() => {
  searchByLatest()
})





const materials = useCourseMaterials()
const categoryToSearch = ref<string>('All')
const toDownload = ref<any>({})
const listGroupName = ref<string>('RECENT UPLOADS:')

function searchByLatest() {
  categoryToSearch.value = 'All'
  listGroupName.value = 'RECENT UPLOADS: ';
  materials.searchLoading = true
  materials.getLatestMaterials()
}

function searchByName(str: string) {
  listGroupName.value = 'RESULTS BY SEARCH: ' + str;
  categoryToSearch.value = ''
  materials.searchLoading = true
  materials.materialsByName(str)
}

function searchByCategory(cate: any) {
  listGroupName.value = 'RESULTS FOR CATEGORY: ' + cate.category_name;
  categoryToSearch.value = cate.category_name
  materials.searchLoading = true
  materials.materialsByCaterogy(cate.category_id)
}



</script>

<style scoped>
.material-card {
  cursor: pointer;
  height: 100%;
}

.icon-left {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 20px;
  padding: 5px;
  font-size: 30px;
  color: #ff3c0070;
  background-color: #ff3c0010;
}

.details-right {
  padding: 7px;
}

.details-right .title {
  font-weight: bold;
  font-size: 14px;
  /* color: #ff3c00; */
}

.details-right .info {
  color: #979494;
  font-size: 11px;
}

.fs-11 {
  font-size: 11px;
}

.cate-list-item {
  color: rgba(33, 37, 41, 0.75);
  cursor: pointer;
}

.cate-list-item:hover {
  color: #111;
}

@media (max-width: 768px) {
  .newsletter {
    margin-top: 200px;
  }
}
</style>