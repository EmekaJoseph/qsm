<template>
    <div>
        <div class="modal fade" id="editMaterial" tabindex="-1" aria-hidden="true">
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
                                        <label>Name:</label>
                                        <textarea v-model="thisItem.name" class="form-control" rows="3"></textarea>
                                    </div>
                                    <div class="col-md-12">
                                        <label>Pages:</label>
                                        <input v-model="thisItem.pages" type="text" class="form-control">
                                    </div>
                                    <div class="col-md-12">
                                        <label>Category:</label>
                                        <select v-model="thisItem.category_id" class="form-control  form-select">
                                            <option v-for="option in categories" :value="option.category_id" :key="option">
                                                {{ option.category_name }}
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-md-12 mt-4">
                                        <button type="button" v-if="!isSaving" data-bs-dismiss="modal"
                                            class="float-end btn btn-custom-light ms-3 ">
                                            Cancel
                                        </button>
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
import { MaterialsAPI } from '@/store/functions/axiosManager';

const fxn = useFunction.fx
const isSaving = ref(false)
const emit = defineEmits(['done'])
const material_api = new MaterialsAPI()

const prop = defineProps({
    item: {
        type: Object,
        required: true
    },

    categories: {
        type: Object,
        required: true
    }
})

const thisItem = reactive({
    name: prop.item.name,
    pages: prop.item.pages,
    category_id: prop.item.category_id,

})

watchEffect(() => {
    thisItem.name = prop.item.name
    thisItem.pages = prop.item.pages
    thisItem.category_id = prop.item.category_id
})




async function updateDetails() {
    if (!thisItem.name || !thisItem.pages || !thisItem.category_id) {
        fxn.Toast('some fields are empty', 'warning')
        return;
    }

    isSaving.value = true
    let obj = {
        name: thisItem.name,
        pages: thisItem.pages,
        category_id: thisItem.category_id,
    }

    try {
        await material_api.updateDetails(prop.item.material_id, obj)
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

