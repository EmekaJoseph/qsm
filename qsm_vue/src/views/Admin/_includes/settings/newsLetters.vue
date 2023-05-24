<template>
    <div class="card border-0 bg-white rounded-4 h-100">
        <div class="card-header bg-transparent fw-bold  border-0 p-3">
            <i class="bi bi-envelope-check-fill"></i> NewslettersList <span>({{ list.length }})</span>
        </div>
        <div class="card-body px-4 list-scroll">
            <div class="mt-3 card p-3 ">
                <span v-for="({ email, id }, i) in list" :key="i">
                    {{ email }} <span>
                        <button @click="removeEmail(id)"
                            class="btn btn-link  btn-sm text-danger text-decoration-none m-0 p-0 ms-1 ">
                            X
                        </button>
                    </span>,
                </span>
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

async function removeEmail(id: string) {
    if (confirm('Delete this Email?, WARNING: This cannot be undone!')) {
        await admin_api.deleteNewslettersList(id)
        getNewslettersList()
    }
}

let interval = setInterval(() => {
    getNewslettersList()
}, 10000)

onUnmounted(() => {
    clearInterval(interval)
})

</script>
