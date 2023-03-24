<template>
    <div class="row g-3">
        <div class=" col-lg-5">
            <materialsCategories />
        </div>
        <div class=" col-lg-7">
            <messagesList />
        </div>
        <div class=" col-lg-5">
            <changePassword />
        </div>
    </div>
</template>

<script setup lang="ts">
import materialsCategories from './_includes/settings/materialsCategories.vue';
import messagesList from './_includes/settings/messagesList.vue';
import changePassword from './_includes/settings/changePassword.vue';
</script>
