<template>
    <div class="mobile-menu-area d-sm-block d-md-block d-lg-none">
        <nav class="navbar bg-body-tertiar">
            <div class="container-fluid">
                <a href="#" class="navbar-brand">
                    <img src="assets/images/logo.png" alt="qsm-logo">
                </a>

                <div data-bs-toggle="offcanvas" data-bs-target="#offcanvas" class="menu-icon">
                    <i class=" bi bi-list"></i>
                </div>
            </div>
        </nav>


        <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasLabel">
            <div class="offcanvas-header pb-0">
                <h5 class="offcanvas-title" id="offcanvasLabel"></h5>
                <button ref="btnClose" type="button" class="btn-close fs-4" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="card border-0">
                    <div class="card-body pt-2">
                        <!-- <ul data-bs-dismiss="offcanvas"> -->
                        <ul>
                            <li> <router-link to="/">Home</router-link> </li>
                            <li> <router-link to="/about">About us</router-link> </li>
                            <li><router-link to="/materials">Materials</router-link></li>
                            <li><router-link to="/trainings">Trainings</router-link></li>
                            <li><router-link to="/blog">Blog</router-link></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';

const btnClose = ref<any>()

onBeforeRouteLeave(() => {
    btnClose.value.click()
})

</script>

<style scoped>
.navbar {
    background-color: #FF3C00;
    color: #fff !important;
    /* padding-block: 10px; */
}

.menu-icon {
    font-size: 30px;
}

.offcanvas {
    min-height: 50vh !important;
    /* padding-left: 10px; */
}


/* .offcanvas-body ul {
    display: flex;
    justify-content: space-between;
} */

.offcanvas-body ul li {
    list-style-type: none;
    list-style-type: circle;
    margin-bottom: 30px;
}

.text-mute {
    color: #cac8c8;
    font-size: small;
    font-weight: normal;
}

.active {
    background-color: transparent !important;
    color: #111 !important;
    font-weight: normal;
    font-size: 16px;
}
</style>