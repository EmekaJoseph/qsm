<template>
    <div>
        <div class="modal fade" id="instantBooking" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light-subtle">
                        <div class="fw-bold">
                            Booking Form
                        </div>
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">

                        <div class="row justify-content-center gy-3">
                            <div class="col-md-12">
                                <div class="py-3 p-1 card shadow-sm bg-light rounded-0">
                                    <div class="table-responsive">
                                        <table style="font-size: 14px;" class="table table-sm">
                                            <tbody>
                                                <tr>
                                                    <th><i class="bi bi-dot text-success"></i>
                                                    </th>
                                                    <td>{{ item.title }}</td>
                                                    <td class="text-end">N{{ fxn.AddCommas(item.price) }}</td>
                                                </tr>
                                                <tr class="bg-light">
                                                    <th colspan="2" class="text-end">TOTAL:</th>
                                                    <th class="text-end">N{{ fxn.AddCommas(item.price) }}</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="p-3 card rounded-0">
                                    <form class="row gy-3">
                                        <div class="col-md-12 col-lg-6">
                                            <label>Full Name <span class="text-danger">*</span></label>
                                            <input v-model="field.name" type="text" class="form-control " required>

                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input v-model="field.email" type="email" class="form-control " required>

                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <label>Phone <span class="text-danger">*</span></label>
                                            <input v-maska data-maska="###########" v-model="field.phone" type="text"
                                                class="form-control " required>
                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <label>Company Name: </label>
                                            <input v-model="field.company" type="text" class="form-control ">
                                        </div>

                                        <div class="col-md-12 mt-5">

                                            <button type="button" v-if="!field.isSending" data-bs-dismiss="modal"
                                                class="float-end btn btn-custom-secondary ms-3 ">
                                                Cancel
                                            </button>
                                            <button v-if="!field.isSending" @click.prevent="submitForm"
                                                class="float-end btn theme-btn  w-auto">
                                                <i class="bi bi-check-lg"></i> Register
                                            </button>
                                            <button disabled v-else class="float-end btn theme-btn  w-auto">
                                                <i class="bi bi-check-lg"></i> Sending...
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
import { UsersAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
import { vMaska } from "maska"



const prop = defineProps({
    item: {
        type: Object,
        required: true
    }
})


const fxn = useFunction.fx
const users_api = new UsersAPI()


const field = reactive({
    name: '',
    email: '',
    phone: '',
    company: '',
    isSending: false
})



function submitForm() {
    if (!field.name) {
        fxn.Toast('Name is required', 'warning')
        return
    }

    if (!field.email) {
        fxn.Toast('email required', 'warning')
        return
    }

    if (!field.phone) {
        fxn.Toast('Phone number required', 'warning')
        return
    }

    if (!fxn.isEmail(field.email)) {
        fxn.Toast('Invalid email format', 'warning')
        return
    }



    let obj = {
        trainings: prop.item.id.toString(),
        name: field.name,
        email: field.email,
        phone: field.phone,
        total: prop.item.price,
        company: !field.company ? null : field.company,
    }

    sendRequest(obj)
}

async function sendRequest(req: object) {

    field.isSending = true

    try {
        await users_api.registerTraining(req)
        field.name = ''
        field.email = ''
        field.phone = ''
        field.company = ''
        field.isSending = false
        fxn.Toast('Your registration has been submitted', 'success')
        btnX.value.click()

    }
    catch (error) {
        field.isSending = false
        fxn.Toast('Network error', 'error')
    }
}




const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>

<style scoped></style>

