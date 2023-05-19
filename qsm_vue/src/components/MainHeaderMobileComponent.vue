<template>
    <div class="mobile-menu-area d-sm-block d-md-block d-lg-none fixed-top">
        <nav class="navbar bg-body-tertiar">
            <div class="container-fluid">
                <a href="#" class="navbar-brand">
                    <img src="@/assets/images/logo2w.png" width="40" alt="qsm-logo">
                </a>

                <div ref="btnOpenCanvas" data-bs-toggle="offcanvas" data-bs-target="#offcanvas" class="menu-icon">
                    <i class=" bi bi-list"></i>
                </div>
            </div>
        </nav>


        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasLabel">
            <div class="offcanvas-header pb-0">
                <h5 class="offcanvas-title" id="offcanvasLabel"></h5>
                <button ref="btnClose" type="button" class="btn-close fs-4" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <div class="offcanvas-body small">
                <div class="card border-0">
                    <div class="card-body pt-2">
                        <!-- <ul data-bs-dismiss="offcanvas"> -->
                        <ul>
                            <li> <router-link to="/"><i class="bi bi-dash-lg"></i> Home</router-link> </li>
                            <li> <router-link to="/about"><i class="bi bi-dash-lg"></i> About Us</router-link> </li>
                            <li> <router-link to="/contact"><i class="bi bi-dash-lg"></i> Contact Us</router-link> </li>
                            <li><router-link to="/trainings"><i class="bi bi-dash-lg"></i> Upcoming Trainings</router-link>
                            </li>
                            <li><router-link to="/materials"><i class="bi bi-dash-lg"></i> Course Materials</router-link>
                            </li>
                            <li><router-link to="/newsletters"><i class="bi bi-dash-lg"></i> Newletters</router-link></li>
                            <li><router-link to="/blog-home"><i class="bi bi-dash-lg"></i>Useful tips</router-link></li>
                        </ul>


                    </div>
                </div>
            </div>
            <div ref="btnOpenCanvas" data-bs-toggle="offcanvas" data-bs-target="#offcanvas"
                class="closer bg-light  text-center fw-bold">
                close <i class="bi bi-arrow-right"></i>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute()
const btnClose = ref<any>()
const btnOpenCanvas = ref<any>()

watch(() => route.path, () => {
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
    /* min-height: 60vh !important; */
    width: 80%;
}


/* .offcanvas-body ul {
    display: flex;
    justify-content: space-between;
} */

.offcanvas-body ul li {
    list-style-type: none;
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

.closer {
    position: fixed;
    bottom: 0;
    padding: 20px;
    /* display: flex;
    justify-content: center; */
    /* text-align: center; */
    width: 100%;
}
</style>