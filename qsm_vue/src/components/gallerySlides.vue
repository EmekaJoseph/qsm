<template>
    <div class="col-md-12">
        <div class="card p-2 shadow">
            <Carousel :autoplay="3000" :wrap-around="true">
                <Slide v-for="slide in 33" :key="slide">
                    <img class="carousel__item" :src="'qsm_gallery/slide' + (slide + 1) + '.jpeg'" alt="">
                </Slide>
            </Carousel>
        </div>
    </div>
</template>

<script setup lang="ts">
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel';

</script>

<style scoped>
.carousel__item {
    width: 100vw;
    height: 350px;
    object-fit: cover;
}

@media (max-width: 994px) {
    .carousel__item {
        height: 200px;
    }
}
</style>

