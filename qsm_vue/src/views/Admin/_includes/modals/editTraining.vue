<template>
    <div>
        <div class="modal fade" id="editTraining" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light">
                        <!-- <span class="fw-bold">{{ item.name }}</span> -->
                        <span class="fw-bold">Edit:</span>
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div class="row justify-content-center gy-3">
                            <div class="col-md-12">
                                <div v-if="item.image" class="image-holder fill">
                                    <img class="img-fluid" :src="`${hostURL}/trainings_images/${item.image}`" alt="">
                                </div>
                            </div>
                            <div class="col-md-12 ">
                                <form class="row g-3">
                                    <div class="col-md-12">
                                        <label>Title:</label>
                                        <textarea v-model="thisItem.title" class="form-control" rows="2"></textarea>
                                    </div>
                                    <div class="col-md-12" style="margin-bottom: 70px; height: 250px">
                                        <label>Info:</label>
                                        <QuillEditor content-type="html" toolbar="minimal"
                                            v-model:content="thisItem.info" />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Venue:</label>
                                        <textarea v-model="thisItem.venue" class="form-control" rows="2"></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Start:</label>
                                        <input v-model="thisItem.start_date" type="date" class="form-control">
                                    </div>

                                    <div class="col-md-6">
                                        <label>End:</label>
                                        <input v-model="thisItem.end_date" type="date" class="form-control">
                                    </div>
                                    <div class="col-md-12">
                                        <span v-if="item.image">Change Image:</span>
                                        <span v-else>Add Image:</span>
                                        <input ref="inputFileEl" @change="grabFile" type="file"
                                            accept="image/jpeg, image/png, image/jpg" class="form-control">
                                    </div>

                                    <div class="col-md-12 mt-3">
                                        <button v-if="!isSaving" @click.prevent="updateDetails"
                                            class="float-end theme-btn btn-custom-secondary btn">Update
                                        </button>
                                        <button v-else class="float-end theme-btn btn" disabled>Updating...</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, watchEffect } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
import useFunction from '@/store/functions/useFunction';
import { TrainingsAPI, hostURL } from '@/store/functions/axiosManager';

const fxn = useFunction.fx
const isSaving = ref(false)
const emit = defineEmits(['done'])
const training_api = new TrainingsAPI()
const inputFileEl = ref<any>(null)

const prop = defineProps({
    item: {
        type: Object,
        required: true
    }
})

const thisItem = reactive({
    title: prop.item.title,
    info: prop.item.info,
    venue: prop.item.venue,
    start_date: prop.item.start_date,
    end_date: prop.item.end_date,
    image: '',
})

watchEffect(() => {
    thisItem.title = prop.item.title
    thisItem.info = prop.item.info
    thisItem.venue = prop.item.venue
    thisItem.start_date = prop.item.start_date
    thisItem.end_date = prop.item.end_date
})

function grabFile(e: any) {
    thisItem.image = e.target.files[0]
}



async function updateDetails() {
    if (!thisItem.title || !thisItem.venue || !thisItem.info || !thisItem.start_date || !thisItem.end_date) {
        fxn.Toast('check compulsory fields', 'warning')
        return;
    }

    if (!(thisItem.start_date <= thisItem.end_date)) {
        fxn.Toast('invalid date duration', 'warning')
        return;
    }

    const obj = new FormData();
    obj.append('title', thisItem.title);
    obj.append('venue', thisItem.venue);
    obj.append('info', thisItem.info);
    obj.append('start_date', thisItem.start_date);
    obj.append('end_date', thisItem.end_date);
    if (thisItem.image)
        obj.append('image', thisItem.image);


    isSaving.value = true

    try {
        let resp = await training_api.updateDetail(prop.item.id, obj)
        console.log(resp);
        if (resp.status == 203) {
            fxn.Toast('Title already exists', 'warning')
            isSaving.value = false
            return
        }
        fxn.Toast('updated', 'success')
        emit('done')
        isSaving.value = false
        btnX.value.click()
        inputFileEl.value.value = ''
    } catch (error) {
        fxn.Toast('internet error', 'error')
        isSaving.value = false
    }

}


const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>

<style scoped>
.info-panel {
    padding: 10px;
    border: none;
    background-color: var(--theme-color-bg);
    border-radius: 0%;
}

.image-holder {
    /* cursor: pointer; */
    transition: all 0.5s ease;
    height: 150px;
    width: auto;
}

.fill {
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden
}

.fill img {
    flex-shrink: 0;
    min-width: 100%;
    min-height: 100%
}
</style>

