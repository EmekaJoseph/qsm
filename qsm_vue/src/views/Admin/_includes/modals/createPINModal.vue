<template>
    <div>
        <div class="modal fade" id="createPINModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light">
                        <span v-if="!thisItem.code" class="fw-bold">ACCESS PIN:</span>
                        <span v-else class="fw-bold text-success">PIN CREATED!</span>
                        <span class="float-end">
                            <button @click="closeModal" ref="btnX" class="btn btn-close" data-bs-dismiss="modal"
                                aria-label="Close">
                            </button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div v-if="thisItem.code"
                            class="d-flex justify-content-center align-content-center fs-3 text-success py-3">
                            {{ thisItem.code }}
                        </div>
                        <div v-else class="row justify-content-center gy-3">
                            <div class="col-md-12">
                                <form class="row g-3">
                                    <div class="col-md-12">
                                        <input v-model="thisItem.reference" class="form-control" type="text"
                                            placeholder="reference name">
                                    </div>
                                    <div class="col-md-12 mt-3">
                                        <button v-if="!isSaving" @click.prevent="updateDetails"
                                            class="float-end theme-btn btn-custom-secondary btn w-100">Generate</button>
                                        <button v-else class="float-end theme-btn btn w-100" disabled>Generating...</button>
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
import { MaterialsAPI } from '@/store/functions/axiosManager';

const fxn = useFunction.fx
const isSaving = ref(false)
const emit = defineEmits(['done'])
const material_api = new MaterialsAPI()

const prop = defineProps({
    material_id: {
        // type: String,
        required: true
    },
})

const thisItem = reactive({
    material_id: prop.material_id,
    reference: '',
    code: ''
})

watchEffect(() => {
    thisItem.material_id = prop.material_id
})


async function updateDetails() {
    if (!thisItem.reference) {
        fxn.Toast('Please add a reference', 'warning')
        return;
    }

    isSaving.value = true
    try {
        let resp = await material_api.generate_pin(thisItem.material_id, thisItem.reference)
        if (resp.status == 200) {
            thisItem.code = resp.data
            isSaving.value = false
        }
    } catch (error) {
        fxn.Toast('internet error', 'error')
        isSaving.value = false
    }
}

function closeModal() {
    btnX.value.click()
    isSaving.value = false
    thisItem.code = ''
    thisItem.reference = ''
    emit('done')
}


const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    closeModal()
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

