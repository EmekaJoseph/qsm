<template>
    <div class="menuSection">
        <ul class="list-group list-group-flush">
            <!-- <li class="list-group-item" :class="{ 'gActive': (route.name == 'Dashboard') }">
                <router-link :to="{ name: 'Dashboard' }">
                    <i class="bi bi-grid-1x2"></i>&nbsp;
                    Dashboard
                </router-link>
            </li> -->

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'Overview') }">
                <router-link :to="{ name: 'Overview' }">
                    <i class="bi bi-window-desktop"></i>&nbsp;
                    Overview
                </router-link>
            </li>

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'Trainings') }">
                <router-link :to="{ name: 'Trainings' }">
                    <i class="bi bi-file-earmark-easel"></i>&nbsp;
                    Trainings
                </router-link>
            </li>

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'Materials') }">
                <router-link :to="{ name: 'Materials' }">
                    <i class="bi bi-files"></i>&nbsp;
                    Materials
                </router-link>
            </li>

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'Archives') }">
                <router-link :to="{ name: 'Archives' }">
                    <i class="bi bi-archive"></i>&nbsp;
                    Archives
                </router-link>
            </li>

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'BlogEdit') }">
                <router-link :to="{ name: 'BlogEdit' }">
                    <i class="bi bi-pencil"></i>&nbsp;
                    Useful Tips
                </router-link>
            </li>

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'News-Letters') }">
                <router-link :to="{ name: 'News-Letters' }">
                    <i class="bi bi-file-earmark"></i>&nbsp;
                    Newsletters
                </router-link>
            </li>

            <li class="list-group-item" :class="{ 'gActive': (route.name == 'Settings') }">
                <router-link :to="{ name: 'Settings' }">
                    <i class="bi bi-gear"></i>&nbsp;
                    Settings
                </router-link>
            </li>

            <li class="list-group-item mt-5">
                <button data-bs-dismiss="offcanvas" @click="logOut"
                    class="btn btn-light bg-danger-subtle btn-sm pe-5">Logout</button>
            </li>
        </ul>
    </div>
</template>

<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router';
import { useAccount } from '@/store/Account'
import { AdminAPI } from '@/store/functions/axiosManager';


const account = useAccount()
const admin_api = new AdminAPI()
const route = useRoute();
const router = useRouter();


async function logOut() {
    try {
        await admin_api.logout(account.state.id)
    } catch (error) {
        // 
    }
    account.state = account.nullState;
    router.replace({ path: '/admin' })
}


</script>

<style scoped>
.menuSection {
    margin-top: 30px;
}

.list-group-item {
    background-color: transparent;
    color: #fff;
    margin-bottom: 10px;
    border: none;
    font-size: 17px;
}

.list-group-item a {
    text-decoration: none;
    padding: 10px 40px 10px 10px;
    color: #111;
}


a:not(.gActive):hover {
    color: #111;
}

.active {
    color: var(--theme-color2) !important;
    background-color: transparent !important;
    font-weight: normal;
}

.gActive {
    background-color: #e7e5e5a4;
    border-right: 2px solid var(--theme-color2) !important;
}

@media screen and (max-width: 767px) {
    .list-group-item {
        margin-bottom: 16px;
        border: none;
        /* font-size: 16px; */
    }

    .list-group-item a {
        text-decoration: none;
        padding: 5px;
        color: #111;
    }


}
</style>