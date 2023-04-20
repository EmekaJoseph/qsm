<template>
    <div>
        <div class="modal fade" id="regList" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light">
                        <span class="fw-bold">Registrations: ({{ list.length }})</span>
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div class="table-responsive">
                            <table class="table table-sm table-hover">
                                <thead>
                                    <tr>
                                        <th>S/N</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Company</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(line, index) in list" :key="index">
                                        <th>{{ (index + 1) }}</th>
                                        <td>{{ line.name }}</td>
                                        <td>{{ line.email }}</td>
                                        <td>{{ line.phone }}</td>
                                        <td>{{ line.company }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer border-0">
                        <export-excel :data="list" :fields="excelFields" :name="`qsm_trainings.xls`">
                            <button class="btn btn-dark"><i class="bi bi-download"></i> Export</button>
                        </export-excel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';

defineProps({
    list: {
        type: Object,
        required: true
    }
})

const excelFields = {
    'Name': 'name',
    'Email': 'email',
    'Phone': 'phone',
    'Company': 'company'
}

const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>
