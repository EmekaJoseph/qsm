<template>
    <div class="row gy-3">


        <!-- ARCHIVE LIST ############################################# -->
        <div class="col-md-5 list-scroll">
            <div class="card rounded-4 h-100">
                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    Archives <span class="small"> ({{ archives.list.length }}) </span>
                </div>
                <div class="card-body">
                    <div v-if="archives.loading">
                        <PageLoading />
                    </div>

                    <div v-else class="table-responsive">
                        <div class="col-md-12">
                            <button data-bs-toggle="modal" data-bs-target="#newArchiveModal"
                                class=" float-end btn btn-custom-light btn-sm p-2 py-1 mb-4">
                                New Archive <i class="bi bi-plus-circle-fill"></i>
                            </button>
                        </div>
                        <table class="table table-sm table-hover">
                            <tbody>
                                <tr style="cursor: pointer;"
                                    :class="{ 'bg-secondary-subtle': (arch == archives.onDisplay) }"
                                    v-for="arch in archives.list" :key="arch">
                                    <th>
                                        <i v-if="arch.count == '0'" class="bi bi-folder"></i>
                                        <i v-else class="bi bi-folder-fill"></i>
                                    </th>
                                    <td @click="showArchiveDetails(arch)" class="text-capitalize archive-name">{{
                                        arch.archive_name }}
                                        <div class="xxsmall text-lowercase">{{ arch.created }}</div>
                                    </td>
                                    <td @click="showArchiveDetails(arch)" class="xsmall">
                                        <div>{{ arch.count }} {{ arch.count == 1 ? 'mat' : 'mats' }}</div>
                                    </td>
                                    <td @click="archives.toEdit = arch" data-bs-toggle="modal"
                                        data-bs-target="#renameArchiveModal" class="table-btn">
                                        <i class="bi bi-pencil"></i>
                                    </td>
                                    <td @click="deleteArchive(arch)" class="table-btn text-danger">
                                        <i class="bi bi-trash3"></i>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <renameArchiveModal :item="archives.toEdit" @done="getArchives" />
            <newArchiveModal @done="getArchives" />
        </div>


        <!-- ARCHIVE CONTENTS -->
        <div v-if="archives.onDisplay.archive_name" class="col-md-7 list-scroll">
            <div class="card h-100">
                <div v-if="archives.onDisplay.archive_name" class="card-header bg-transparent fw-bold  border-0 p-3">
                    {{ archives.onDisplay.archive_name }}<span class="small">
                        ({{ showing.list.length }})
                    </span>
                    <div v-if="showing.selected.length" class="col-md-12">
                        <button @click="materialToArchive()"
                            class="float-end m-0 p-0 px-2 btn btn-danger text-danger bg-danger-subtle btn-sm">
                            Remove
                        </button>
                        <!-- <button class="float-end m-0 p-0 px-2 btn btn-dark btn-custom-secondary btn-sm me-3">
                            <i class="bi bi-folder"></i> Move
                        </button> -->
                        <div class="dropdown float-end me-3">
                            <button class="m-0 p-0 px-2 btn btn-light btn-custom-secondary btn-sm dropdown-toggle"
                                type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-folder"></i> Move
                            </button>
                            <ul class="dropdown-menu">
                                <li v-for="arch in archives.list" :key="arch">
                                    <button v-if="arch.archive_id != archives.onDisplay.archive_id"
                                        @click="materialToArchive(arch.archive_id)" class="btn btn-link m-0 dropdown-item">
                                        <i v-if="arch.count == '0'" class="bi bi-folder"></i>
                                        <i v-else class="bi bi-folder-fill"></i>
                                        {{ arch.archive_name }}
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="card-body">

                    <div v-if="showing.loading">
                        <PageLoading />
                    </div>
                    <div v-else>
                        <div v-if="!showing.list.length">
                            <EmptyListComponent str="No Materials" />
                        </div>
                        <div v-else>

                            <EasyDataTable alternating v-model:items-selected="showing.selected" :headers="headers"
                                :items="showing.list" show-index>
                            </EasyDataTable>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script setup lang="ts">
import { reactive, onMounted } from 'vue'
import { ArchiveAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
import type { Header } from "vue3-easy-data-table";
import renameArchiveModal from './_includes/modals/renameArchiveModal.vue';
import newArchiveModal from './_includes/modals/newArchiveModal.vue';
// import archiveContentsModal from './_includes/modals/archiveContentsModal.vue';

const archive_api = new ArchiveAPI();
const fxn = useFunction.fx;
const archives: any = reactive({
    loading: true,
    list: [],
    toEdit: {},
    onDisplay: ''
})

const showing: any = reactive({
    list: [],
    loading: false,
    selected: []
})

onMounted(() => {
    getArchives()
})

async function getArchives() {
    try {
        let resp = await archive_api.list();
        archives.loading = false;
        archives.list = resp.data
        // console.log(resp);
    } catch (error) {
        // 
    }
}


async function deleteArchive(arch: any) {
    fxn.Confirm(`Delete this Archive?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                if (arch.count != '0') {
                    fxn.Toast('archive is not empty', 'warning')
                    return;
                }
                try {
                    let resp = await archive_api.remove(arch.archive_id)
                    if (resp.status == 200) {
                        getArchives();
                        fxn.Toast('Record Deleted', 'success')
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }


            }
        })
}
async function showArchiveDetails(arch: any) {
    showing.loading = true
    archives.onDisplay = arch
    showing.selected = []
    let { data } = await archive_api.archiveDetails(arch.archive_id)
    showing.list = data
    showing.loading = false
    console.log(data);

}

const headers: Header[] = [
    { text: "MATERIAL_ID", value: "material_code" },
    { text: "NAME", value: "name" },
    { text: "", value: "operation" },
];

function materialToArchive(new_id?: any) {
    let qst = !new_id ? `Remove from Archive?` : `Move to Archive?`;
    fxn.Confirm(qst, 'Continue')
        .then(async (result) => {
            if (result.isConfirmed) {

                let ids = showing.selected.map((x: any) => x.material_id)
                let materialsStr = ids.toString();

                let obj = {
                    op_type: !new_id ? 'remove' : 'move',
                    archive_id: archives.onDisplay.archive_id,
                    material_ids: materialsStr,
                    move_to: new_id ? new_id : ''
                }

                try {
                    let resp = await archive_api.materialToArchive(obj)
                    if (resp.status == 200) {
                        getArchives();
                        showArchiveDetails(archives.onDisplay)
                        showing.selected = []
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }
            }
        })


}

</script>

<style scoped>
.table-btn {
    font-size: 14px;
    cursor: pointer;
}
</style>