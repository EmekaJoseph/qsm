<template>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasMenu" aria-labelledby="offcanvasLabel">
        <div class="offcanvas-header pb-0">
            <h5 class="offcanvas-title" id="offcanvasLabel">
                QSM
            </h5>
            <button ref="btnCloseCanvas" type="button" class="btn-close fs-4" data-bs-dismiss="offcanvas"
                aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="card border-0">
                <div class="card-body pt-4 ps-0">
                    <MenuList />
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue';
import { useRoute } from 'vue-router';
import MenuList from './MenuList.vue'

const btnCloseCanvas = ref<any>()

const route = useRoute();

watch(() => route.path, () => {
    btnCloseCanvas.value.click()
})
</script>

<style scoped>
.offcanvas {
    width: 270px !important;
}
</style>