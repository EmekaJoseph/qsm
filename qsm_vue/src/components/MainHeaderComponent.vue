<template>
    <div>
        <div id="sticky-header" class="itsoft_nav_manu d-md-none d-lg-block d-sm-none d-none"
            :class="{ 'fixed-top': y > 50 }">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="logo">
                            <router-link to="/">
                                <img v-if="!(y > 50)" src="@/assets/images/logo2.png" width="50" alt="logo">
                                <img v-else src="@/assets/images/logo2w.png" width="50" alt="logo">
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <nav class="itsoft_menu">
                            <ul class="nav_scroll">
                                <!-- <li v-if="y > 2000"><a href="/#" class="a-text"> <i class="bi bi-arrow-up"></i> Top</a></li>
                                <li v-else><a href="/#" class="a-text">Home</a></li> -->

                                <li>
                                    <router-link class="a-text" :to="{ path: '/', hash: '' }">Home</router-link>
                                </li>

                                <li>
                                    <a href="#" class="a-text">Company<i class="bi bi-chevron-down"></i><span><i
                                                class="fas fa-angle-right"></i></span></a>
                                    <ul class="sub-menu">

                                        <li><router-link to="/about">About Us</router-link> </li>
                                        <li><router-link to="/trainings">Trainings</router-link></li>
                                        <li><router-link to="/materials">Materials</router-link></li>
                                        <!-- <li>
                                            <router-link :to="{ path: '/about', hash: '#history' }">History</router-link>
                                        </li> -->
                                    </ul>
                                </li>

                                <!-- <li>
                                    <a href="#" class="a-text">Services<i class="bi bi-chevron-down"></i><span><i
                                                class="fas fa-angle-right"></i></span></a>
                                    <ul class="sub-menu">
                                        <li><router-link to="/trainings">Trainings</router-link></li>
                                        <li><router-link to="/materials">Materials</router-link></li>
                                    </ul>
                                </li> -->

                                <li>
                                    <router-link class="a-text" to="/blog-home">Blog</router-link>
                                </li>
                            </ul>
                            <div class="nav-btn  d-sm-none d-md-none d-lg-inline-block">
                                <router-link class="fw-light fs-6" :to="{ path: '/', hash: '#instantform' }">Get
                                    Consultation</router-link>
                            </div>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
        <MainHeaderMobileComponent />
    </div>
</template>

<script setup lang="ts">
import MainHeaderMobileComponent from '@/components/MainHeaderMobileComponent.vue';
import { useWindowScroll } from '@vueuse/core'
const { y } = useWindowScroll()
</script>

<style scoped>
a {
    text-decoration: none;
}

.nav-btn a {
    background: #FF3C00 !important;
    border: 1px solid #FF3C00 !important;
    color: #fff !important;
}

.itsoft_nav_manu nav ul li a {
    margin: 30px 20px;
    color: #111 !important;
}

.fixed-top {
    background-color: #FF3C00 !important;
}

.fixed-top nav ul li,
.fixed-top nav .a-text,
.fixed-top nav ul li .bi {
    color: #fff !important;
}

.fixed-top nav .sub-menu li a {
    color: #111 !important;
}

.fixed-top .nav-btn a {
    border-color: #fff !important;
}

.active {
    background-color: transparent !important;
}
</style>