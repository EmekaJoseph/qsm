<template>
    <div class="choose-us-section pt-75 pb-70">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="choose-us-thumb">
                        <img src="@/assets/images/choose-us/ch1.png" alt="choose-us">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="choose-us-content-section pl-35">
                        <div class="section-head-container">
                            <div class="section-head">
                                <h5>// Why Choose Us</h5>
                                <h3 class="text-white">Some Of the Reasons you </h3>
                                <h2 class="text-white">Should <span> ChooseUs</span></h2>
                                <span class="section-head-bar"></span>
                                <p> We have a Proffessional body membership with <b>Nigeria Institute of Training and
                                        Development (NITAD)</b></p>
                            </div>
                        </div>
                        <div class="choose-us-content-container">
                            <div class="single-content  pb-25  pt-35 d-flex">
                                <div class="content-single-icon">
                                    <i class="flaticon-process"></i>
                                </div>
                                <div class="single-content-inner">
                                    <h5 class="inner-content-title pb-15 text-white">Experience</h5>
                                    <p>For 18 years, we have sustained integrity and proficiency in designing trainings,
                                        seminar,
                                        workshop and facility audits.
                                    </p>
                                </div>
                            </div>
                            <div class="single-content  pb-25 d-flex">
                                <div class="content-single-icon">
                                    <i class="flaticon-system"></i>
                                </div>
                                <div class="single-content-inner">
                                    <h5 class="inner-content-title pb-15 text-white">Quality</h5>
                                    <p>Our reputation for quality service is attested to by participants who
                                        attend our trainings. </p>
                                </div>
                            </div>
                            <div class="single-content  pb-25 d-flex">
                                <div class="content-single-icon">
                                    <i class="flaticon-next-1"></i>
                                </div>
                                <div class="single-content-inner">
                                    <h5 class="inner-content-title pb-15 text-white">Our Faculty</h5>
                                    <p>We are equipped with reputable hands.
                                        <router-link :to="{ path: '/about', hash: '#faculty' }">Read More..</router-link>
                                    </p>
                                </div>
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

