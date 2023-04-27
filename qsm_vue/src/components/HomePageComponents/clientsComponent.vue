<template>
    <div class="bg-light pt-75 pb-75">
        <div class="container py-5">
            <div class="text-center mb-5">
                <div class="section-head mb-2">
                    <h3 class="text-black">Some of our Clienteles</h3>
                </div>
                <span class="section-head-bar-2"></span>
            </div>

            <Carousel class="d-none d-md-block" :autoplay="2000" :items-to-show="5" :wrap-around="true">
                <Slide v-for="slide in logos" :key="slide">
                    <div class="carousel__item">
                        <img :src="'qsm_clients/' + slide" width="150" alt="qsm_client">
                    </div>
                </Slide>
            </Carousel>

            <Carousel class="d-md-none" :autoplay="2000" :items-to-show="3" :wrap-around="true">
                <Slide v-for="slide in logos" :key="slide">
                    <div class="carousel__item">
                        <img :src="'qsm_clients/' + slide" width="80" alt="qsm_client">
                    </div>
                </Slide>
            </Carousel>

            <br>

            <section class="section">
                <div class="row justify-content-center gy-4">
                    <div class="col-md-4 d-flex justify-content-center  align-items-center">
                        <div>
                            <div class="h4 mb-0 text-center fw-bold">PHOTO GALLERY</div>
                            <div class="small text-muted text-center">
                                ..photos from our previous/past trainings.
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <gallerySlides />
                    </div>
                </div>

            </section>

        </div>
    </div>
</template>

<script setup lang="ts">
import { Carousel, Slide } from 'vue3-carousel'
import gallerySlides from '@/components/gallerySlides.vue'

let logos = ['client1.png', 'client2.png', 'client3.png', 'client4.png', 'client5.png', 'client6.png', 'client7.png']
</script>

<style scoped></style>