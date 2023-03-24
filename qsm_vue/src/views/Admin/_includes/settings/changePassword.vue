<template>
    <div class="card border-0 bg-white rounded-4 h-100">
        <div class="card-header bg-transparent fw-bold  border-0 p-3">
            <i class="bi bi-lock"></i> Change Password:
        </div>
        <div class="card-body px-4 pb-4">
            <form class="row gy-3">
                <div class="col-md-12">
                    <label>Current Password:</label>
                    <input v-model="field.oldPass" type="password" class="form-control form-control-lg">
                </div>
                <div class="col-md-12">
                    <label>New Password:</label>
                    <input v-model="field.newPass" type="password" class="form-control form-control-lg">
                </div>
                <div class="col-md-12">
                    <label>Repeat Password:</label>
                    <input v-model="field.newPass2" type="password" class="form-control form-control-lg">
                </div>

                <div class="col-md-12 mt-4">
                    <button @click.prevent="submit" v-if="!field.isLoading"
                        class="btn theme-btn w-100 btn-lg">Change</button>
                    <button v-else class="btn theme-btn w-100 btn-lg" disabled>Please wait...</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
import { AdminAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
import { useAccount } from '@/store/Account';


const admin_api = new AdminAPI()
const account = useAccount()
const fxn = useFunction.fx

const field = reactive({
    oldPass: '',
    newPass: '',
    newPass2: '',
    isLoading: false,
})

async function submit() {
    if (field.oldPass && field.newPass && field.newPass2) {
        if (field.newPass !== field.newPass2) {
            fxn.Toast('passwords do not match', 'warning')
            return;
        }

        let obj = {
            id: account.state.id,
            oldPass: field.oldPass,
            newPass: field.newPass
        }

        // field.isLoading = true

        try {

            let resp = await admin_api.changePassword(obj)

            if (resp.status == 203) {
                fxn.Toast('password invalid', 'error')
                field.isLoading = false
                return;
            }

            fxn.Toast('Password updated', 'success')
            field.oldPass = ''
            field.newPass = ''
            field.newPass2 = ''
            field.isLoading = false

        } catch (error) {
            field.isLoading = false
            fxn.Toast('internet error', 'error')
        }
    }
}


</script>
