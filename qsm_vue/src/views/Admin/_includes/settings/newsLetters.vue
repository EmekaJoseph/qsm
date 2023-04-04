<template>
    <div class="card border-0 bg-white rounded-4 h-100">
        <div class="card-header bg-transparent fw-bold  border-0 p-3">
            <i class="bi bi-envelope-check-fill"></i> NewslettersList <span>({{ list.length }})</span>
        </div>
        <div class="card-body px-4 list-scroll">
            <div class="mt-3 card p-3 ">
                {{ list.toString() }}
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'
import { AdminAPI } from '@/store/functions/axiosManager';


const admin_api = new AdminAPI()
const list = ref<any>([])

onMounted(() => {
    getNewslettersList()
})

async function getNewslettersList() {
    let { data } = await admin_api.newslettersList()
    list.value = data
}


let interval = setInterval(() => {
    getNewslettersList()
}, 10000)

onUnmounted(() => {
    clearInterval(interval)
})

</script>
