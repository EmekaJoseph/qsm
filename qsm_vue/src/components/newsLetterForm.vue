<template>
    <div class="col-12">
        <label class="fw-bold small">Subscribe to our newsletters</label>
        <div v-show="form.text" class="xsmall" :class="'text-' + form.texype">{{ form.text }}
        </div>
        <form @submit.prevent="subscribe" class="input-group search-form">
            <input :disabled="form.isSaving" v-model.trim="form.email" type="text" class="form-control bg-white"
                placeholder="your email">
            <button v-if="!form.isSaving" @click="subscribe" class="input-group-text btn theme-btn"> <i
                    class="bi bi-arrow-right"></i></button>
            <button v-else class="input-group-text btn theme-btn"> <i class="bi bi-hourglass-bottom"></i></button>
        </form>
    </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue';
import { UsersAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';

const users_api = new UsersAPI()
const fxn = useFunction.fx;

const form = reactive({
    email: '',
    isSaving: false,
    text: '',
    texype: ''
})

async function subscribe() {
    form.text = ''
    form.texype = ''
    if (form.email) {
        if (!fxn.isEmail(form.email)) {
            form.text = 'invalid email format'
            form.texype = 'danger'
            return;
        }
        form.isSaving = true
        try {
            let resp = await users_api.newsLetterSub(form.email)
            if (resp.status == 203) {
                form.text = 'already subscribed!'
                form.texype = 'danger'
                form.isSaving = false;
                return;
            }

            form.texype = 'success'
            form.text = 'Thank you for subscribing!'
            form.isSaving = false;
            form.email = '';
        } catch (error) {
            form.isSaving = false;
        }
    }
}

</script>
