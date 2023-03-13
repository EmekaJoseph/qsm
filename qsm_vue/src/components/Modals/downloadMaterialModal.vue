<template>
    <div>
        <div class="modal fade" id="downloadMaterialModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light-subtle">
                        <div class="fw-bold text-muted2">
                            {{ item.name }}
                        </div>
                        <span class="float-end">
                            <button @click="clearModal" ref="btnX" class="btn btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div v-if="!fileToDownLoad.length">
                            <!-- <div class="fw-bold">{{ item.name }}</div> -->
                            <span class=" text-danger small fs-11">
                                <b>Enter One Time Code to download,</b> Code
                                can only be used
                                once!</span>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <input v-model="code" type="text" class="form-control form-control-lg rounded-4"
                                        placeholder="enter code">
                                </div>
                                <div class="col-12 mt-3">
                                    <button @click="checkCode" v-if="!checking"
                                        class="btn btn-lg rounded-4 w-100 theme-btn">
                                        Validate
                                    </button>

                                    <button v-else disabled class="btn btn-dark btn-lg  rounded-4 w-100">
                                        Checking...
                                    </button>
                                    <!-- <button class="btn theme-btn">sss</button> -->
                                </div>


                            </div>
                        </div>
                        <div v-else class="col-12 mt-3">
                            <a class="btn btn-success btn-lg bg-success-subtle text-success w-100 border-0" href="#tile"
                                download>
                                <i class="bi bi-file-earmark-arrow-down-fill"></i> Download File</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
// import { hostURL } from '@/store/functions/axiosInstance';
import useFunction from '@/store/functions/useFunction';


const prop = defineProps({
    item: {
        type: Object,
        required: true
    }
})

const checking = ref(false)

const fxn = useFunction.fx

const code = ref('')
const fileToDownLoad = ref('')



function checkCode() {
    if (code.value) {
        // Axios call with id

        // checking.value = true
        // fileToDownLoad.value = 'image'
        // checking.value = false
    }

}


function clearModal() {
    code.value = ''
    fileToDownLoad.value = ''
    checking.value = false
}


const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>

<style scoped>
/* .download-success-btn {
    color: var(--bs-success);
    width: 100%;
    text-align: center;
    background-color: var(--bs-success-bg-subtle) !important;
    padding: 25px;
} */
</style>

