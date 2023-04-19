<template>
    <div>
        <div class="modal fade" id="renameArchiveModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light">
                        <span class="fw-bold">Rename:</span>
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div class="row justify-content-center gy-3">
                            <div class="col-md-12 ">
                                <form class="row g-3">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" v-model="thisItem.archive_name">
                                    </div>


                                    <div class="col-md-12 mt-3">
                                        <button v-if="!isSaving" @click.prevent="updateDetails"
                                            class="theme-btn btn-custom-secondary btn w-100">Rename</button>
                                        <button v-else class="float-end theme-btn btn w-100" disabled>Please
                                            wait...</button>
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
import { ArchiveAPI } from '@/store/functions/axiosManager';

const fxn = useFunction.fx
const isSaving = ref(false)
const emit = defineEmits(['done'])
const archive_api = new ArchiveAPI()

const prop = defineProps({
    item: {
        type: Object,
        required: true
    },
})

const thisItem = reactive({
    archive_name: prop.item.archive_name,
})

watchEffect(() => {
    thisItem.archive_name = prop.item.archive_name
})




async function updateDetails() {
    if (!thisItem.archive_name) {
        fxn.Toast('field should not be empty', 'warning')
        return;
    }

    isSaving.value = true

    try {
        let resp = await archive_api.updateDetails(prop.item.archive_id, { archive_name: thisItem.archive_name })
        if (resp.status == 203) {
            fxn.Toast('alredy exists', 'warning')
            isSaving.value = false
            return;
        }

        fxn.Toast('updated', 'success')
        emit('done')
        isSaving.value = false
        btnX.value.click()
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

<style scoped></style>

