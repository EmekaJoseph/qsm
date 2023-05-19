<template>
    <div>
        <div class="modal fade" id="editBlog" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm">
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
                            <div class="col-md-12 ">
                                <form class="row g-3">
                                    <div class="col-md-12">
                                        <label>Title:</label>
                                        <textarea v-model="thisItem.title" class="form-control" rows="2"></textarea>
                                    </div>

                                    <!-- <div class="col-md-12">
                                        <label>Category:</label>
                                        <input v-model="thisItem.category" type="text" class="form-control">
                                    </div> -->

                                    <div class="col-md-12 mt-3">
                                        <button v-if="!isSaving" @click.prevent="updateDetails"
                                            class="float-end theme-btn btn-custom-secondary btn">
                                            Update
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
import { NewsLetterAPI } from '@/store/functions/axiosManager';

const fxn = useFunction.fx
const isSaving = ref(false)
const emit = defineEmits(['done'])
const nLetter_api = new NewsLetterAPI()
const inputFileEl = ref<any>(null)

const prop = defineProps({
    item: {
        type: Object,
        required: true
    }
})

const thisItem = reactive({
    title: prop.item.title,
})

watchEffect(() => {
    thisItem.title = prop.item.title
})




async function updateDetails() {
    if (!thisItem.title) {
        fxn.Toast('field is empty', 'warning')
        return;
    }

    const obj = {
        title: thisItem.title
    }

    isSaving.value = true
    try {
        let resp = await nLetter_api.updateNewsletter(prop.item.id, obj)
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
        inputFileEl.value = ''
    } catch (error) {
        console.log(error);

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

