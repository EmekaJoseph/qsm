
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



      <div class="container py-5 animate__animated animate__fadeIn text-black">

        <div class="py-5" v-if="materials.loading">
          <PageLoading />
        </div>


        <div v-else>
          <div class="py-5" style="min-height: 300px;" v-if="!materials.list.length">
            <EmptyListComponent str="No Available Materials" />
          </div>

          <div v-else class="row gy-3">
            <div class="col-md-8">
              <div class="col-md-8">
                <SearchMaterialField @submit="searchByName" />
              </div>

              <div class="row gy-3 mt-sm-3">
                <div class="col-12 text-muted2 mb-sm-2 small" style="letter-spacing: 0.3rem;">
                  RECENT UPLOADS:
                </div>
                <div v-for="matr in materials.list" :key="matr" class="col-12 col-sm-6" @click="selected = matr"
                  data-bs-toggle="modal" data-bs-target="#downloadMaterialModal">
                  <div class="card rounded-0 shadow-sm material-card">
                    <div class="d-flex">
                      <div class="col-2 icon-left">
                        <i class="bi bi-file-earmark-lock"></i>
                      </div>
                      <div class="col-10 details-right">
                        <div class="title">
                          {{ matr.name }}
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

            <div class="col-md-4">
              <div class="card rounded-0 border-top-0 border-end-0 border-bottom-0 border-light shadow-sm">
                <div class="card-body">
                  <div class="card-header bg-transparent fw-bold border-0">Categories:</div>
                  <ul class="list-group list-group-flush">
                    <li @click="searchByCategory('All')" class="list-group-item cate-list-item hover-tiltX"
                      :class="{ 'theme-color': categoryToSearch == 'All' }">
                      All
                    </li>
                    <li @click="searchByCategory(li)" v-for="li in materials.categories" :key="li"
                      class="list-group-item cate-list-item hover-tiltX"
                      :class="{ 'theme-color': categoryToSearch == li }">
                      {{ li }}
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <downloadMaterialModal :item="selected" />
    <FooterComponent />
  </div>
</template>



<script setup lang="ts">
import { ref, onMounted } from 'vue';
import SearchMaterialField from '@/components/SearchMaterialField.vue';
import { useCourseMaterials } from '@/store/materials';
import downloadMaterialModal from '@/components/Modals/downloadMaterialModal.vue';


onMounted(() => {
  materials.getList()
})

const materials = useCourseMaterials()
const searchStr = ref<string>('')
const categoryToSearch = ref<string>('All')
const selected = ref<any>({})

function searchByName(str: string) {
  searchStr.value = str
  materials.loading = true
  materials.getList(str)
}

function searchByCategory(str: string) {
  categoryToSearch.value = str
  materials.loading = true
  materials.getList('All', str)
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
</style>