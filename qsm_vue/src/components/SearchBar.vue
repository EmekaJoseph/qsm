<template>
    <div>
        <div class="d-none d-sm-block">
            <div class="col-md-12">
                <form @submit.prevent="sendToParent" class="input-group">
                    <input type="text" v-model="str" class="form-control" placeholder="search material">
                    <span @click="sendToParent" class="input-group-text p-lg-2 px-4">
                        <i class="bi bi-search me-lg-3 hover-tiltY"></i>
                    </span>
                </form>
            </div>
        </div>

        <div class="fixed-bottom-btn d-sm-none">
            <div class="justify-content-end floatPanel">
                <span class=" shadow animate__heartBeat animate__infinite animate__slower">
                    <i class="bi bi-search text-white"></i>
                </span>

            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
const emit = defineEmits(['submit'])
const str = ref<string>('')

function sendToParent() {
    if (str.value.length) {
        emit('submit', str.value)
    }
}

</script>

<style scoped>
.input-group-text {
    background-color: #fff !important;
    /* border-left: none !important; */
    border-radius: 30px;
    /* margin-right: 600px; */
    border-color: #c5c2c2;
}

.input-group-text .bi {
    font-size: 24px;
    cursor: pointer;
    color: #a5a3a3;
}

.bi:hover {
    color: #111;
}

input {
    border-right: none !important;
    border-radius: 30px;
    padding-left: 30px !important;
    border-color: #c5c2c2;
}

input:focus {
    border-color: #c5c2c2;
}

@media screen and (max-width: 767px) {
    .input-group-text .bi {
        font-size: 16px;
    }
}









.fixed-bottom-btn {
    position: fixed;
    bottom: 0;
    right: 0;
    z-index: 999;
}


.floatPanel {
    margin-bottom: 80px;
    padding-right: 50px;
    display: flex;
    z-index: 999;
    position: relative;
    transition: all ease-in-out 0.4s;
}

@media screen and (max-width: 767px) {
    .floatPanel {
        padding-right: 20px;
    }
}

.floatPanel>span {
    font-size: 14px;
    background-color: #FF3C00;
    color: #fff !important;
    padding: 16px 20px;
    border-radius: 100%;
}
</style>