<template>
    <div id="sticky-header" class="sticky-top itsoft_nav_manu d-md-none d-lg-block d-sm-none d-none"
        :class="{ 'bg-theme': y > 50 }">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="logo">
                        <a href="#">
                            <img src="assets/images/logo.png" alt="logo">
                        </a>
                    </div>
                </div>
                <div class="col-md-9">
                    <nav class="itsoft_menu">
                        <ul class="nav_scroll">
                            <li v-if="y > 50"><a href="#">Back to Top</a></li>
                            <li v-else><a href="#">Home</a></li>

                            <li>
                                <a href="#">Company<i class="bi bi-chevron-down"></i><span><i
                                            class="fas fa-angle-right"></i></span></a>
                                <ul class="sub-menu">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">History</a></li>
                                    <li><a href="#">Archive</a></li>
                                    <li><a href="#">Contact </a></li>

                                </ul>
                            </li>

                            <li>
                                <a href="#">Services<i class="bi bi-chevron-down"></i><span><i
                                            class="fas fa-angle-right"></i></span></a>
                                <ul class="sub-menu">
                                    <li><a href="#">Trainings</a></li>
                                    <li><a href="#">Materials</a></li>
                                    <li><a href="#">Products</a></li>

                                </ul>
                            </li>

                            <li><a href="#">Blog</a></li>
                        </ul>
                        <div class="nav-btn  d-sm-none d-md-none d-lg-inline-block">
                            <a href="#">Get Consultant</a>
                        </div>
                    </nav>

                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { useWindowScroll } from '@vueuse/core'
const { y } = useWindowScroll()
</script>

<style scoped>
@import '@/assets/template/responsive.css';
@import '@/assets/template/style.css';
@import '@/assets/template/ui-kit.css';
@import '@/assets/template/default.css';

a {
    text-decoration: none;
}

.nav-btn a {
    background: #FF3C00;
    border: 1px solid #FF3C00;
    color: #fff;
}

.itsoft_nav_manu nav ul li a {
    margin: 30px 22px;

}

.bg-theme {
    background-color: #FF3C00 !important;
}

.bg-theme nav ul li,
.bg-theme nav ul li a,
.bg-theme nav ul li .bi {
    color: #fff !important;
}

.bg-theme .nav-btn a {
    background: #fff;
    border: 1px solid #FF3C00;
    color: #FF3C00;
}
</style>