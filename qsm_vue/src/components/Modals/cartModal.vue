<template>
    <div>
        <div class="modal fade" id="cartModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light-subtle">
                        <div class="fw-bold"><i class="bi bi-cart3 text-success"></i> Cart Items
                            <span class="badge bg-success-subtle text-dark rounded-4">
                                {{ trainings.cart.length }}
                            </span>
                            <span v-if="trainings.cart.length" @click="clearCart"
                                class="ms-2 cursor-pointer text-danger small">
                                Clear</span>
                        </div>
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div v-if="!trainings.cart.length" class="text-center p-5">
                            Cart is empty
                        </div>
                        <div v-else class="row justify-content-center gy-3">
                            <div class="col-md-12">
                                <div class="py-3 p-1 card shadow-sm bg-light rounded-0">
                                    <div class="table-responsive">
                                        <table class="table table-sm">
                                            <tbody>
                                                <tr v-for="trn in trainings.cart" :key="trn">
                                                    <th style="width: 5%;"><i class="bi bi-check-lg text-success"></i>
                                                    </th>
                                                    <td style="width:90%">{{ trn.title }}</td>
                                                    <td>
                                                        <button @click="trn.inCart = null" class="btn m-0 p-0"><i
                                                                class="bi bi-x-lg"></i></button>
                                                    </td>
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
                                            <input v-model="field.phone" type="number" class="form-control " required>
                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <label>Company Name: </label>
                                            <input v-model="field.company" type="text" class="form-control ">
                                        </div>

                                        <div class="col-md-12 mt-5">
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
import { useTrainings } from '@/store/trainings'
import useFunction from '@/store/functions/useFunction';

const fxn = useFunction.fx
const users_api = new UsersAPI()

const trainings = useTrainings()

const field = reactive({
    name: '',
    email: '',
    phone: '',
    company: '',
    isSending: false
})

function clearCart() {
    trainings.list.forEach((x: { inCart: null; }) => {
        x.inCart = null
    });
}

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
        trainings: (trainings.cart.map((x: { id: any; }) => x.id)).toString(),
        name: field.name,
        email: field.email,
        phone: field.phone,
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
        clearCart()


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

