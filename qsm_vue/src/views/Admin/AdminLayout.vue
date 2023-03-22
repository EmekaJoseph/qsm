

<template>
    <nav data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" class="fixed-top navbar bg-body-tertiary top-nav">
        <div class="container-fluid">
            <a class="navbar-brand">QSM - Admin</a>
            <div class="fs-1 d-md-none"><i class="bi bi-list"></i></div>
        </div>
    </nav>

    <offCanvasMenu />

    <sideBar />

    <div class="adminMain">
        <RouterView />
    </div>
</template>

<script setup lang="ts">
import { RouterView, } from 'vue-router'
import sideBar from './_includes/sideBar.vue';
import offCanvasMenu from './_includes/offCanvasMenu.vue';
</script>


<style scoped>
.adminMain {
    min-height: 100vh;
    /* background-color: #f5f5f5a4; */
    background-color: #e7e5e5a4;
    padding-top: 120px;
    padding-bottom: 100px;
    margin-left: 250px;
    padding-inline: 20px;

}

.top-nav {
    margin-left: 250px;

}

@media screen and (max-width: 767px) {
    .adminMain {
        margin-left: 0px;
        padding-inline: 10px;
        margin-bottom: 20px;
    }

    .top-nav {
        margin-left: 0px;

    }
}
</style>