<template>
    <div class="card border-0 bg-white rounded-4 h-100">
        <div class="card-header bg-transparent fw-bold  border-0 p-3">
            <i class="bi bi-chat-left-dots"></i>
            Inbox <span>({{ messages.list.length }})</span>
        </div>
        <div class="card-body px-4 list-scroll">
            <div class="mt-3 card p-3 ">
                <div v-if="messages.loading">
                    <PageLoading />
                </div>

                <div v-else>

                    <div class="text-muted2" v-if="!messages.list.length">
                        No messages
                    </div>

                    <div v-else>
                        <ul class="list-group list-group-flush">
                            <li v-for="li in messages.list" :key="li" class="list-group-item my-1">
                                <span @click="readMessage(li.id)" class="name-name cursor-pointer hover-tiltX"
                                    :class="{ 'theme-color': li.isReading }">
                                    <i v-if="li.isReading" class="bi bi-chevron-down"></i>
                                    <i v-else class="bi bi-chevron-right"></i>
                                    {{ li.name }} &nbsp;
                                </span>
                                <span @click="deleteMessage(li.id)" class="float-end">
                                    <button class="btn btn-sm text-danger m-0 p-0 hover-tiltY">
                                        <i class="bi bi-trash3"></i>
                                    </button>
                                </span>
                                <div v-if="li.isReading" class="message-center card border-0 p-3 small bg-warning-subtle">
                                    {{ li.message }}
                                    <div class="xsmall mt-3">
                                        {{ li.email }}, {{ li.phone }}
                                    </div>
                                </div>
                                <span class="float-en me-5 xsmall">{{ li.sent }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, onMounted, onUnmounted } from 'vue'
import { AdminAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
// import { useTimeAgo } from '@vueuse/core'

// const timeago = (date: Date) => useTimeAgo(new Date(date));

const admin_api = new AdminAPI()
const fxn = useFunction.fx


onMounted(() => {
    messages.loading = true
    getMessages()
})


const messages: any = reactive({
    loading: false,
    list: [],
})

function readMessage(id: any) {
    let thisMsg = messages.list.find((x: { id: any; }) => x.id == id)
    thisMsg.isReading = thisMsg.isReading ? false : true;
}

async function getMessages() {
    let { data } = await admin_api.getMessages()
    messages.list = data
    messages.loading = false

}

async function deleteMessage(id: any) {
    fxn.Confirm(`Delete Messsage?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                try {
                    await admin_api.deleteMessage(id)
                    getMessages();
                    fxn.Toast('Message Deleted', 'success')
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }
            }
        })
}


// let interval = setInterval(() => {
//     getMessages()
// }, 10000)

// onUnmounted(() => {
//     clearInterval(interval)
// })

</script>

<style scoped>
.name-name:hover {
    font-weight: bold;
}
</style>
