<template>
    <div v-if="y > 50" class="fixed-bottom-btn">
        <div class="justify-content-end floatPanel">
            <a href="https://api.whatsapp.com/send?phone=+2348023647417&text=__" target="_blank"
                class="p-3 badge rounded-pill bg-success text-white animate__heartBeat animate__infinite animate__slower fw-light">
                <i class="bi bi-whatsapp"></i> chat with us
            </a>
        </div>
    </div>
</template>

<script setup lang="ts">
import { useWindowScroll } from '@vueuse/core'
const { y } = useWindowScroll()

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
</style>
