<template>
    <div v-if="blogList.length" class="blog-section pt-70 pb-70">
        <div class="container">
            <div class="section-head text-center mb-85">
                <h5>// Our Blogs</h5>
                <h2 class="text-white"> Resources &amp; Latest <span> News </span></h2>
                <span class="section-head-bar-2"></span>
            </div>

            <div class="row justify-content-center g-3">

                <div v-for="blog in blogList" :key="blog" class="col-md-4 cursor-pointer">
                    <div @click="blogDetails(blog.blog_id)" class="blog-single-carousel h-100">
                        <div class="blog-thumb fill">
                            <img :src="blog.image" alt="Blog img">
                            <div class="blog-meta-top">
                                <ul>
                                    <li>{{ blog.category }}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <span>{{ new Date(blog.created_at).toUTCString() }}</span>
                            </div>
                            <h5>{{ blog.title }}</h5>

                            <div class="blog-learn-more">
                                <a href="#">
                                    Read More
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue';
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
    blogList.value = data.slice(0, 3)
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


<style scoped>
.blog-meta-top li {
    font-size: 12px;
    font-weight: 500;
    background: #1d0a04d3;
    color: #fff;
    text-transform: uppercase;
    padding: 4px 15px;
    letter-spacing: 1px;
    border-radius: 3px;
}

.blog-thumb {
    height: 200px !important;
}


.fill {
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden
}

.fill img {
    flex-shrink: 0;
    min-width: 100%;
    min-height: 100%;
}
</style>