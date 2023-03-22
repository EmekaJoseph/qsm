<template>
    <div>
        <div class="sidenav">
            <span class="brand">
                <img src="@/assets/images/logo2.png" width="40" alt="Logo">
            </span>

            <menu-list />
        </div>
    </div>
</template>

<script setup lang="ts">
import MenuList from './MenuList.vue';
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


@media screen and (max-width: 767px) {
    .sidenav {
        display: none;
    }
}
</style>