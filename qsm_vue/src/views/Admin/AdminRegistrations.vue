<template>
    <div>
        <div class="row justify-content-center gy-3"></div>
    </div>
</template>

<script setup lang="ts">
import { onMounted, reactive } from 'vue';
import { TrainingsAPI } from '@/store/functions/axiosManager';

const training_api = new TrainingsAPI();
const Regs = reactive({
    active: [],
    inActive: []
})



onMounted(() => {
    getRegList()
})


async function getRegList() {
    let { data } = await training_api.registrationList();
    Regs.active = data.active;
    Regs.inActive = data.inActive;
    console.log(data);

}
</script>

<style scoped></style>