<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">
      <div class="container pt-5">

        <div class="row gy-4">

          <div class="col-md-8">
            <h3>{{ currentBlog.title }}</h3>
            <div v-if="currentBlog.image" class="row gx-4">
              <div class="col-lg-12">
                <div clas="img-holder fill">
                  <img :src="currentBlog.image" alt="">
                </div>
              </div>
            </div>
            <div class="container py-5 animate__animated animate__fadeIn text-black">
              <div class="col-12 text-muted2 mb-sm-2 small" style="letter-spacing: 0.2rem;">
                {{ new Date(currentBlog.created_at).toDateString() }}
              </div>

              <div class="blog-text" v-html="currentBlog.body"> </div>

            </div>
          </div>

          <div class="col-md-4">
            <newsLetterForm />
          </div>
        </div>




      </div>



    </section>

    <FooterComponent />
  </div>
</template>



<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { BlogAPI } from '@/store/functions/axiosManager';
import { useRoute, useRouter } from 'vue-router';
import newsLetterForm from '@/components/newsLetterForm.vue';

const blog_api = new BlogAPI()
const route = useRoute()
const router = useRouter()
const currentBlog = ref<any>({})

onMounted(() => {
  getBlogDetails()
})



async function getBlogDetails() {
  let blog_id: any = route.query.blog
  let resp = await blog_api.blogDetails(blog_id)
  if (resp.status == 203) {
    router.replace({
      path: `/blog-home`,
    })
  }
  else {
    currentBlog.value = resp.data
  }

}
</script>

<style>
.blogTopic {
  font-size: 23px !important;
  font-weight: 500;
  cursor: pointer;
  /* text-transform: capitalize; */
}

.blogTopic:hover {
  color: var(--theme-color);
}

@media (max-width: 994px) {
  .blogTopic {
    font-size: 18px !important;
  }
}
</style>
