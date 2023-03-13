<template>
    <div>
        <div class="modal fade" id="cartModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
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
                                <div class="py-3 p-1 card shadow-s rounded-0">
                                    <div class="table-responsive">
                                        <table class="table table-sm">
                                            <tbody>
                                                <tr v-for="trn in trainings.cart" :key="trn">
                                                    <th style="width: 10%;"><i class="bi bi-check-lg text-success"></i>
                                                    </th>
                                                    <td style="width:80%">{{ trn.title }}</td>
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
                                        <div class="col-md-12">
                                            <label>Name <span class="text-danger">*</span></label>
                                            <input v-model="field.name" type="text" class="form-control " required>

                                        </div>
                                        <div class="col-md-12">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input v-model="field.email" type="email" class="form-control " required>

                                        </div>
                                        <div class="col-md-12">
                                            <label>Phone <span class="text-danger">*</span></label>
                                            <input v-model="field.phone" type="number" class="form-control " required>
                                        </div>
                                        <div class="col-md-12">
                                            <label>Company Name: </label>
                                            <input v-model="field.company" type="text" class="form-control ">
                                        </div>

                                        <div class="col-md-12 mt-4">
                                            <button @click.prevent="sendRequest" class="btn theme-btn w-100 btn-lg">
                                                Register
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
// import { hostURL } from '@/store/functions/axiosInstance';
import { useTrainings } from '@/store/trainings'
import useFunction from '@/store/functions/useFunction';

const fxn = useFunction.fx

const trainings = useTrainings()

const field = reactive({
    name: '',
    email: '',
    phone: '',
    company: '',
})

function clearCart() {
    trainings.list.forEach(x => {
        x.inCart = null
    });
}

function sendRequest() {
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



    let obj = {
        tranings: (trainings.cart.map((x: { id: any; }) => x.id)).toString(),
        name: field.name,
        email: field.email,
        phone: field.phone,
        company: !field.company ? null : field.company,
    }

    console.log(obj);

}




const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>

<style scoped></style>

