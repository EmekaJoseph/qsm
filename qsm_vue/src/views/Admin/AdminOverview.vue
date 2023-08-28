<template>
    <div>
        <div class="row gy-3">
            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="big-number">{{ overview.data.visitors_total ?? 0 }}</div>
                        <div>
                            <span>Total visitors</span>
                            <span class="float-end"><i class="bi bi-people"></i></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="big-number">{{ overview.data.visitors_thisMonth ?? 0 }}</div>
                        <div>
                            <span>Visitors this Month</span>
                            <span class="float-end"><i class="bi bi-people"></i></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="big-number">{{ overview.data.trainings_active ?? 0 }}</div>
                        <div>
                            <span>Upcoming trainings</span>
                            <span class="float-end"><i class="bi bi-file-easel"></i></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="big-number">{{ overview.data.materials ?? 0 }}</div>
                        <div>
                            <span>Materials uploaded</span>
                            <span class="float-end"><i class="bi bi-journals"></i></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12 mt-5 d-none d-md-block">
                <div class="card bg-transparent shadow-sm py-5 border-0">
                    <div class="card-body text-muted">
                        <div class="text-center fw-bolder">QSM MANAGER</div>
                        <div class="text-center ">QSM Training &amp; Consulting Limited</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, onMounted } from 'vue';
import { AdminAPI } from '@/store/functions/axiosManager';

const admin_api = new AdminAPI;

const overview = reactive<any>({
    isLoading: true,
    data: []
})

onMounted(() => {
    getOverView()
})

async function getOverView() {
    let resp = await admin_api.getOverView()
    if (resp.status == 200) {
        overview.isLoading = false
        overview.data = resp.data
    }
}

</script>

<style scoped>
.big-number {
    font-size: 2.3rem;
    font-weight: bold;
}
</style>