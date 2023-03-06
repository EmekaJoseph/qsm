<template>
    <div>
        <div id="sticky-header" class="itsoft_nav_manu d-md-none d-lg-block d-sm-none d-none"
            :class="{ 'fixed-top': y > 50 }">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="logo">
                            <router-link to="/">
                                <img src="assets/images/logo.png" alt="logo">
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <nav class="itsoft_menu">
                            <ul class="nav_scroll">
                                <li v-if="y > 2000"><a href="/#" class="a-text"> <i class="bi bi-arrow-up"></i> Top</a></li>
                                <li v-else><a href="/#" class="a-text">Home</a></li>

                                <li>
                                    <a href="#" class="a-text">Company<i class="bi bi-chevron-down"></i><span><i
                                                class="fas fa-angle-right"></i></span></a>
                                    <ul class="sub-menu">

                                        <li>
                                            <router-link to="/about">About Us</router-link>
                                        </li>

                                        <li><a href="/about#history">History</a></li>
                                        <li><a href="#">Archive</a></li>
                                        <li><a href="#">Contact </a></li>

                                    </ul>
                                </li>

                                <li>
                                    <a href="#" class="a-text">Services<i class="bi bi-chevron-down"></i><span><i
                                                class="fas fa-angle-right"></i></span></a>
                                    <ul class="sub-menu">
                                        <li><a href="#">Trainings</a></li>
                                        <li><a href="#">Materials</a></li>
                                        <li><a href="#">Products</a></li>

                                    </ul>
                                </li>

                                <li><a href="#" class="a-text">Blog</a></li>
                            </ul>
                            <div class="nav-btn  d-sm-none d-md-none d-lg-inline-block">
                                <a href="#">Get Consultant</a>
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
    background: #FF3C00;
    border: 1px solid #FF3C00;
    color: #fff;
}

.itsoft_nav_manu nav ul li a {
    margin: 30px 15px;

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
    border-color: #fff;
}

.active {
    background-color: transparent !important;
}
</style>