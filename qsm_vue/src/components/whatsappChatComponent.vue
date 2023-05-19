<template>
    <!-- <div v-if="y > 50" class="fixed-bottom-btn"> -->
    <div class="fixed-bottom-btn">
        <div class="justify-content-end floatPanel">
            <div class="card animate__heartBeat animate__infinite animate__slower">
                <div class="card-header small fw-bold border-0 bg-transparent pt-3">Chat with us:</div>
                <div class="card-body d-flex justify-content-between p-0 pb-2">
                    <div></div>
                    <a class="text-success" href="https://api.whatsapp.com/send?phone=+2348023647417&text=__"
                        target="_blank">
                        <i class="bi bi-whatsapp fs-2"></i>
                    </a>
                    <a class="text-danger" href="mailto:qsmtrainingconsulting@gmail.com" target="_blank">
                        <i class="bi bi-envelope-at fs-2"></i>
                    </a>
                    <div></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
// import { useWindowScroll } from '@vueuse/core'
// const { y } = useWindowScroll()

</script>

<style scoped>
.fixed-bottom-btn {
    position: fixed;
    bottom: 0;
    right: 0;
    z-index: 999;
}


.floatPanel {
    margin-bottom: 50px;
    padding-right: 10px;
    display: flex;
    z-index: 999;
    position: relative;
    transition: all ease-in-out 0.4s;
}

.card {
    /* padding: 10px; */
    border-radius: 40px;
    border-bottom-left-radius: 0px;
    border: 1px solid var(--bs-danger);
}
</style>
