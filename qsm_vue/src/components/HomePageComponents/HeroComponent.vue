<template>
    <div class="hero-section d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="hero-content-area text-left ">
                        <h4 class="animate__animated animate__slideInLeft">QSM Training &amp; Consulting LTD</h4>
                        <!-- <h1> Consultancy Services <br>at its Best</h1> -->
                        <h1 class="animate__animated animate__slideInLeft"> Training &amp; Consultancy <br> Services at its
                            Best</h1>
                        <!-- <h2>Training &amp; Development, <br> Technical Course
                            &amp; Consultancy Services </h2> -->
                        <p>Training &amp; Development, Technical Course
                            &amp; Consultancy Services</p>
                        <div class="btn-common btn-hero">
                            <a href="#">Learn More <i class="fas fa-angle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-thumb">
                <div class="hero-thumb-inner  animate__animated animate__slideInUp">
                    <img src="@/assets/images/hero/hero.png" alt="slider-img">
                </div>
            </div>
        </div>
        <div class="hero-shape-one rotateme">
            <img src="@/assets/images/hero/hs1.png" alt="shape-1">
        </div>
        <div class="hero-shape-two rotateme">
            <img src="@/assets/images/hero/hs2.png" alt="shape-1">
        </div>
        <div class="hero-shape-three alltuchtopdown">
            <img src="@/assets/images/hero/hs3.png" alt="shape-1">
        </div>
    </div>
</template>

<script setup lang="ts">

</script>

<style scoped>
.hero-thumb-inner,
.hero-thumb-inner img {
    width: 500px;
    margin-left: 100px;
    margin-bottom: 100px;
}


@media (min-width: 768px) and (max-width: 991px) {
    .hero-section {
        height: 600px !important;
    }

}


/* @media (max-width: 991px) {
    .hero-section {
        margin-top: 50px;
    }
} */
</style>