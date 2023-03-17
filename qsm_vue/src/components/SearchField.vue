<template>
    <div class="col-md-12">
        <form @submit.prevent="sendToParent" class="input-group search-form">
            <input @keyup="sendToParent" v-model="str" type="text" class="form-control" placeholder="search material">
            <span @click="sendToParent" class="input-group-text bg-white ">
                <i class="bi bi-search  hover-tiltY"></i>
            </span>
        </form>
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
.search-form input {
    border-right: none !important;
    border-radius: 30px;
    padding-left: 20px !important;
    border-color: #c5c2c2;
}

.input-group-text {
    background-color: #fff !important;
    /* border-left: none !important; */
    border-radius: 30px;
    padding-right: 20px !important;
    /* margin-right: 600px; */
    border-color: #c5c2c2;
}

.bi {
    cursor: pointer;
    color: #a5a3a3;
}

.bi:hover {
    color: #111;
}
</style>