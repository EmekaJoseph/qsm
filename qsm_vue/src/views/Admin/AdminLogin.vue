<template>
    <div class="thForm">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header border-0  fw-bold  text-center py-3">QSM
                            <span class="text-muted">| Manager</span>
                        </div>
                        <div class="card-body py-5 px-4">
                            <form class="row gy-3">
                                <div v-if="admin.errText"
                                    class="text-center text-danger bg-light-subtle rounded-2 py-1 small">
                                    {{ admin.errText }}</div>
                                <div class="col-md-12">
                                    <label>username</label>
                                    <input v-model="admin.username" type="text" class="form-control form-control-lg">
                                </div>
                                <div class="col-md-12">
                                    <label>password</label>
                                    <input v-model="admin.password" :type="password_type"
                                        class="form-control form-control-lg">
                                    <div v-if="password_type == 'password'" @click="password_type = 'text'"
                                        class="float-end hide-show">show</div>
                                    <div v-else @click="password_type = 'password'" class="float-end hide-show">Hide</div>
                                </div>
                                <div class="col-md-12 mt-5">
                                    <button v-if="!admin.loading" @click.prevent="login"
                                        class="btn theme-btn btn-lg w-100">Login</button>
                                    <button v-else disabled class="btn theme-btn btn-lg w-100">Please Wait..</button>
                                </div>
                            </form>
                            <div class="text-center my-3"><router-link to="/">Home</router-link>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { AdminAPI } from '@/store/functions/axiosManager';
import { useRouter } from 'vue-router';
import { useAccount } from '@/store/Account'


const account = useAccount()
const admin_api = new AdminAPI();
const router = useRouter()

const admin = reactive({
    username: '',
    password: '',
    loading: false,
    errText: ''
})

const password_type = ref('password')

async function login() {
    admin.errText = '';
    if (!admin.username) {
        admin.errText = 'username is required';
        return;
    }

    if (!admin.password) {
        admin.errText = 'password is required';
        return;
    }

    let obj = {
        username: admin.username,
        password: admin.password
    }

    admin.loading = true
    try {
        let resp = await admin_api.login(obj)
        if (resp.status == 203) {
            admin.errText = 'Invalid Credentials';
            admin.loading = false
            return;
        }

        admin.password = ''
        admin.username = ''
        account.state = resp.data
        account.token = resp.data.token
        router.replace({ path: '/admin/overview' })
        admin.loading = false

    } catch (error) {
        admin.errText = 'Network error, try again';
        admin.loading = false
    }
}

</script>

<style scoped>
.thForm {
    min-height: 100vh;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    -ms-flex-align: center;
    align-items: center;
    transition: 1.8s ease-in-out;
    overflow: hidden;
    background-color: #eee;
}

.hide-show {
    cursor: pointer;
    font-size: 12px;
    color: var(--bs-success);
}

.hide-show:hover {
    color: #111;
}
</style>