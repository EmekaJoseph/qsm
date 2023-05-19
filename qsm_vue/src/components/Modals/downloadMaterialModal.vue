<template>
    <div>
        <div class="modal fade" id="downloadMaterialModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div v-if="fileToDownLoad.length">
                        <span class="float-end m-2">
                            <button @click="clearModal" ref="btnX" class="btn btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-header border-0 border-bottom bg-light-subtle">
                        <div class="fw-bold text-muted2">
                            {{ item.name }}
                        </div>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div v-if="!fileToDownLoad.length">
                            <!-- <div class="fw-bold">{{ item.name }}</div> -->
                            <div class="row mt-3">
                                <div class="col-12">
                                    <div v-if="!isRequesting" class="card p-3">
                                        <span class=" text-danger small fs-11">
                                            <div class="text-center">Enter One Time Code to download,</div>
                                            <div class="text-center"><b>Code can only be used once!</b></div>

                                        </span>
                                        <div class="col-12">
                                            <input v-model="code" type="text" class="form-control form-control-lg rounded-4"
                                                placeholder="enter code">
                                        </div>
                                        <div class="col-12 mt-3">
                                            <button @click="checkCode" v-if="!checking"
                                                class="btn btn-lg rounded-4 w-100 theme-btn">
                                                Submit
                                            </button>

                                            <button v-else disabled class="btn theme-btn btn-lg  rounded-4 w-100">
                                                Checking...
                                            </button>
                                        </div>
                                    </div>

                                    <div v-else class="card">
                                        <div class="card-header bg-white fw-bold border-0 text-center">Request for Code
                                        </div>
                                        <div class="card-body">
                                            <div class="col-12">
                                                <input v-model="email" type="text"
                                                    class="form-control form-control-lg rounded-" placeholder="your email">
                                            </div>

                                            <div class="col-12 mt-2">
                                                <button @click="sendDownloadRequest"
                                                    class="btn btn-lg rounded- w-100 btn-dark">
                                                    Send Request
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between mt-4">
                                    <div v-show="!isRequesting">
                                        <button @click="isRequesting = true"
                                            class="btn btn-outline-dark xsmall  rounded-4 w-10">
                                            Request for code
                                        </button>
                                    </div>
                                    <div></div>

                                    <div>
                                        <button @click="clearModal" ref="btnX" data-bs-dismiss="modal"
                                            class="btn rounded-4 w-100 btn-light xsmall">
                                            close
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-else class="col-12 mt-2">
                            <!-- <div class="text-center mb-3 text-dark">PIN VALID!</div> -->
                            <a class="btn btn-success btn-lg bg-success-subtle fw-bold text-success w-100 border-0"
                                :href="`${hostURL}/course_materials/${fileToDownLoad}`" download>
                                <i class="bi bi-file-earmark-arrow-down-fill"></i> Download Material</a>
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
import { hostURL, UsersAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';



const users_api = new UsersAPI()
const prop = defineProps({
    item: {
        type: Object,
        required: true
    }
})

const checking = ref(false)

const isRequesting = ref(false)

const code = ref('')
const email = ref('')
const fileToDownLoad = ref('')
const fxn = useFunction.fx



async function checkCode() {
    if (code.value) {
        const obj = {
            material_id: prop.item.id,
            otp: code.value
        }

        checking.value = true

        try {
            const resp = await users_api.downloadMaterial(JSON.stringify(obj))
            if (resp.status == 203) {
                fxn.Toast('Invalid Code', 'error')
                checking.value = false
                return
            }
            fileToDownLoad.value = resp.data
            checking.value = false
        } catch (error) {
            checking.value = false
        }
    }

}

async function sendDownloadRequest() {
    btnX.value.click()
    let obj = {
        material_id: prop.item.id,
        email: email.value
    }

    await users_api.sendDownloadRequest(obj)
    email.value = ''
    fxn.Toast('Request sent', 'success')
}


function clearModal() {
    code.value = ''
    fileToDownLoad.value = ''
    checking.value = false
    isRequesting.value = false

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

