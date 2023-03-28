<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">


      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">Company's</span>
                Blog</h1>
              <div class="animate__animated animate__slideInLeft animate__delay-1s">Latest news and Updates</div>
            </div>

          </div>
        </div>
      </div>


      <div class="container py-5 animate__animated animate__fadeIn text-black">

        <div class="col-12 text-muted2 mb-sm-2 small" style="letter-spacing: 0.2rem;">
          BLOGS LIST
        </div>

        <ul class="list-group list-group-flush mt-5">
          <li @click="blogDetails(blog.blog_id)" v-for="blog in blogList" :key="blog"
            class="list-group-item cate-list-item hover-tiltX shadow-sm mb-2">
            <div class="blogTopic"> {{ blog.title }}</div>
            <span class="xsmall fst-italic text-muted">
              posted {{ blog.created }}
            </span>
          </li>
        </ul>

      </div>
    </section>

    <FooterComponent />
  </div>
</template>



<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { BlogAPI } from '@/store/functions/axiosManager';
import { useRouter } from 'vue-router';


const blog_api = new BlogAPI()
const blogList = ref<any[]>([])
const router = useRouter()

onMounted(() => {
  getBlogs()
})

async function getBlogs() {
  let { data } = await blog_api.list()
  blogList.value = data
}

function blogDetails(blog_id: any) {
  router.push({
    path: `/blog`,
    query: {
      blog: blog_id
    }
  })
}


let interval = setInterval(() => {
  getBlogs()
}, 10000)

onUnmounted(() => {
  clearInterval(interval)
})

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
