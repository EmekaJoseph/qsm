<template>
    <div>

        <div class="sidenav">
            <span class="brand">
                <img src="@/assets/images/logo1.png" width="50" alt="Logo">
            </span>

            <div class="menuSection">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" :class="{ 'gActive': (route.name == 'Dashboard') }">
                        <router-link :to="{ name: 'Dashboard' }">
                            <i class="bi bi-grid-1x2"></i>&nbsp;
                            Dashboard
                        </router-link>
                    </li>

                    <li class="list-group-item" :class="{ 'gActive': (route.name == 'Trainings__') }">
                        <router-link :to="{ name: 'Trainings__' }">
                            <i class="bi bi-file-earmark-easel"></i>&nbsp;
                            Trainings
                        </router-link>
                    </li>

                    <!-- <li class="list-group-item" :class="{ 'gActive': (route.name == 'Registrations') }">
                        <router-link :to="{ name: 'Registrations' }">
                            <i class="bi bi-journal-text"></i>&nbsp;
                            Registrations
                        </router-link>
                    </li> -->

                    <li class="list-group-item" :class="{ 'gActive': (route.name == 'Materials') }">
                        <router-link :to="{ name: 'Materials' }">
                            <i class="bi bi-files"></i>&nbsp;
                            Materials
                        </router-link>
                    </li>

                    <li class="list-group-item" :class="{ 'gActive': (route.name == 'Archive') }">
                        <router-link :to="{ name: 'Archive' }">
                            <i class="bi bi-folder"></i>&nbsp;
                            Archive
                        </router-link>
                    </li>

                    <li class="list-group-item" :class="{ 'gActive': (route.name == 'Settings') }">
                        <router-link :to="{ name: 'Settings' }">
                            <i class="bi bi-gear"></i>&nbsp;
                            Settings
                        </router-link>
                    </li>

                    <li class="list-group-item mt-5">
                        <button class="btn btn-light bg-danger-subtle btn-sm pe-5">Logout</button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { useRoute } from 'vue-router';
const route = useRoute();
</script>

<style scoped>
/* The sidebar menu */
.sidenav {
    height: 100%;
    /* Full-height: remove this if you want "auto" height */
    width: 250px;
    /* Set the width of the sidebar */
    position: fixed;
    /* Fixed Sidebar (stay in place on scroll) */
    z-index: 1;
    /* Stay on top */
    top: 0;
    /* Stay at the top */
    left: 0;
    background-color: #fff;

    overflow-x: hidden;
    /* Disable horizontal scroll */
    /* padding: 25px 10px; */
}

.sidenav .brand {
    padding: 10px 30px 17px 70px;
    /* color: #BD2c00; */
    display: flex;
}

.menuSection {
    margin-top: 30px;
}

@media screen and (max-width: 767px) {
    .sidenav {
        display: none;
    }
}

.list-group-item {
    background-color: transparent;
    color: #fff;
    margin-bottom: 20px;
    border: none;
    font-size: 17px;
}

.list-group-item a {
    text-decoration: none;
    padding: 10px 40px 10px 10px;
    color: #111;
}


a:not(.gActive):hover {
    color: #111;
}

.active {
    color: var(--theme-color2) !important;
    background-color: transparent !important;
    font-weight: normal;
}

.gActive {
    background-color: #e7e5e5a4;
    border-right: 2px solid var(--theme-color2) !important;
}

/* .badge {
    font-size: 9px;
    background-color: #f5f5f5 !important;
    border: 1px solid #ccc !important;
} */
</style>