<script setup lang="ts">
import { RouterView } from 'vue-router'
import sideBar from './_includes/sideBar.vue';
</script>

<template>
    <sideBar />
    <div class="adminMain">
        <RouterView />
    </div>
</template>

<style scoped>
.adminMain {
    min-height: 100vh;
    /* background-color: #f5f5f5a4; */
    background-color: #e7e5e5a4;
    padding-block: 100px;
    margin-left: 250px;
    padding-inline: 20px;

}

@media screen and (max-width: 767px) {
    .adminMain {
        margin-left: 0px;
        padding-inline: 10px;
        margin-bottom: 20px;
    }
}
</style>