<template>
    <div class="services-section pt-70 pb-80">
        <div class="container">
            <div class="section-head pb-65">
                <div class="row align-items-center">
                    <div class="col-sm-12 col-md-12 col-lg-4">
                        <div class="section-title">
                            <h5>// SERVICES</h5>
                            <h3>Our Core Services</h3>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-8">
                        <div class="section-head-content">
                            <p class="pt-0 pb-0">For 18 years, we have sustained integrity and proficiency in designing
                                trainings, seminar,
                                workshop and facility audit for the Food, Pharmaceutical, Water and Cosmetic
                                Manufacturers. Our reputation for quality service is attested to by participants who
                                attend our trainings.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center g-3">

                <div class="col-md-4">
                    <div class="services-carousel-single-item h-100">
                        <div class="services-carousel-thumb">
                            <img src="@/assets/images/services/svs2.jpg" alt="carousel-img">
                        </div>
                        <div class="services-carousel-icon">
                            <i class=" bi bi-file-earmark-easel"></i>
                        </div>
                        <div class="services-content-section">
                            <div class="services-content-title">
                                <h2>Training</h2>
                            </div>
                            <div class="services-content">
                                <p>
                                <ol style="list-style: circle;">
                                    <li>Regulatory Requirements for Product Licencing.</li>
                                    <li>Good Practices for Quality Control Laboratories.</li>
                                    <li>Water Quality Management.</li>
                                </ol>

                                </p>
                            </div>
                            <div class="services-content-btn">
                                <router-link :to="{ path: '/about', hash: '#trainings' }">
                                    Read More <i class="bi bi-chevron-right"></i>
                                    <span><i class="bi fs-5 bi-arrow-right"></i></span>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="services-carousel-single-item h-100  ">
                        <div class="services-carousel-thumb">
                            <img src="@/assets/images/services/svs1.jpg" alt="carousel-img">
                        </div>
                        <div class="services-carousel-icon">
                            <i class="bi bi-person-fill-check"></i>
                        </div>
                        <div class="services-content-section">
                            <div class="services-content-title">
                                <h2>Consulting</h2>
                            </div>
                            <div class="services-content mt-lg-5">
                                <p>
                                <ol style="list-style: circle;">
                                    <li>Special Training/Seminars </li>
                                    <li>Collaboration Training </li>
                                    <li>Facility Audit </li>
                                </ol>
                                </p>
                            </div>
                            <div class="services-content-btn mt-lg-5">
                                <router-link :to="{ path: '/about', hash: '#consulting' }">
                                    Read More <i class="bi bi-chevron-right"></i>
                                    <span><i class="bi fs-5 bi-arrow-right"></i></span>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="services-carousel-single-item h-100 ">
                        <div class="services-carousel-thumb">
                            <img src="@/assets/images/services/svs3.jpg" alt="carousel-img">
                        </div>
                        <div class="services-carousel-icon">
                            <i class="bi bi-journals"></i>
                        </div>
                        <div class="services-content-section">
                            <div class="services-content-title">
                                <h2>Materials</h2>
                            </div>
                            <div class="services-content">
                                <p>We provide course materials related to the courses we teach. These materials are
                                    available for download.</p>
                            </div>
                            <div class="services-content-btn mt-lg-5">
                                <router-link to="/materials">
                                    Read More <i class="bi bi-chevron-right"></i>
                                    <span><i class="bi fs-5 bi-arrow-right"></i></span>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">

</script>

<style scoped>
@media (min-width: 994px) {

    img {
        filter: grayscale(100%);
    }

    img:hover {
        filter: grayscale(0%);
    }
}
</style>