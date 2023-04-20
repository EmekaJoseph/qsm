<template>
    <div class="row g-2">

        <!-- MATERIALS TABLE ###################################### -->
        <div class="col-md-12">
            <div class="card rounded-4">

                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    Materials <span class="small"> ({{ materials.length }})</span>
                    <span v-if="selected.length" class=" float-end">
                        <!-- <button class="btn btn-dark text-dark bg-dark-subtle btn-sm p-0 px-1">
                            <i class="bi bi-archive"></i> Archive
                        </button> -->


                        <div class="dropdown float-end me-3">
                            <button class="btn btn-dark text-dark bg-dark-subtle btn-sm p-0 px-1 dropdown-toggle"
                                type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-folder"></i> Archive
                            </button>
                            <ul class="dropdown-menu">
                                <li v-for="arch in archivesList" :key="arch">
                                    <button @click="materialToArchive(arch.archive_id)"
                                        class="btn btn-link m-0 dropdown-item">
                                        <i v-if="arch.count == '0'" class="bi bi-folder"></i>
                                        <i v-else class="bi bi-folder-fill"></i>
                                        {{ arch.archive_name }}
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </span>
                </div>
                <div class="card-body">
                    <div class=" min-vh-100" v-if="materialsLoading">
                        <PageLoading />
                    </div>
                    <div v-else class="row gy-3">
                        <div class="col-12">
                            <div class="row gy-1">
                                <div v-if="materials.length > 10" class="col-lg-12">
                                    <div class="float-end">
                                        <label>&nbsp;</label>
                                        <input placeholder="search.." type="text" class="form-control"
                                            v-model="searchValue">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 list-scrol">
                            <EasyDataTable alternating v-model:items-selected="selected" :headers="headers"
                                :items="materials" show-index :sort-by="sortBy" :sort-type="sortType" buttons-pagination
                                :search-field="searchField" :search-value="searchValue">
                                <template #item-pin="item">
                                    <button data-bs-toggle="modal" data-bs-target="#createPINModal"
                                        @click="material_id_forNewPIN = item.material_id"
                                        class="me-4 operation-icon btn btn-sm btn-outline-secondary  xsmall    p-0 px-2">
                                        Generate
                                    </button>
                                </template>

                                <template #item-operation="item">
                                    <div class="operation-wrapper">
                                        <span data-bs-toggle="modal" data-bs-target="#editMaterial"
                                            @click="editMaterial(item)" class="me-4 operation-icon">
                                            <i class="bi bi-pencil"></i>
                                        </span>
                                        <span @click="deleteMaterial(item)" class="operation-icon">
                                            <i class="bi bi-trash3 text-danger"></i>
                                        </span>
                                    </div>
                                </template>
                            </EasyDataTable>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODALS ######################################### -->
        <editMaterialModal :item="materialToEdit" :categories="cateDropDown" @done="getMaterials" />
        <!-- <createPINModal /> -->
        <createPINModal @done="getPins" :material_id="material_id_forNewPIN" />

        <!-- NEW MATERIALS FORM ########################################### -->
        <div class="col-md-12 col-lg-5">
            <div class="card rounded-4 h-100">

                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    Upload Material
                </div>
                <div class="card-body">
                    <form @submit.prevent="submitForm" class="row gy-3">
                        <div class="col-md-12">
                            Material File:
                            <input ref="inputFileEl" @change="grabFile" type="file"
                                accept=".doc, .docx, application/msword, .pdf, .txt, .xlsx, .xls, .pptx, .ppt"
                                class="form-control">
                        </div>

                        <div class="col-md-12">
                            <label>Material Name:</label>
                            <textarea v-model="form.name" class="form-control" rows="2"></textarea>
                        </div>

                        <div class="col-4">
                            <label>Pages:</label>
                            <input v-model="form.pages" type="number" class="form-control">
                        </div>
                        <div class="col-8">
                            <label class="small">Date published: <span class="xsmall">(optional)</span> </label>
                            <input v-model="form.published" type="date" class="form-control">
                        </div>

                        <div class="col-md-12">
                            <label>Category:</label>
                            <select v-model="form.category_id" class="form-control  form-select">
                                <option v-for="option in cateDropDown" :value="option.category_id" :key="option">
                                    {{ option.category_name }}
                                </option>
                            </select>

                        </div>
                        <div class="col-md-12 mt-4">
                            <button v-if="!form.isSaving" type="submit"
                                class="btn btn-custom-secondary  float-end w-100">Submit</button>
                            <button v-else class="btn btn-custom-secondary  float-end w-100" disabled>Submitting...</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- ACTIVE PINS ###################################################-->
        <div class="col-md-12 col-lg-7">
            <div class="card rounded-4 h-100">
                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    ACTIVE PINS
                </div>
                <div class="card-body list-scroll">
                    <div v-if="!active_pins.length">
                        <EmptyListComponent str="No Active PINS" />
                    </div>
                    <div v-else>

                        <div class="table-responsive">
                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Material</th>
                                        <th>PIN</th>
                                        <th>Reference</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(code, index) in active_pins" :key="index">
                                        <th>{{ (index + 1) }}.</th>
                                        <td> {{ code.material_code ? code.material_code : '--' }}</td>
                                        <td class="text-success"> {{ code.code }}</td>
                                        <td> {{ code.ref }}</td>
                                        <td>
                                            <button @click="deletePin(code.id)" class="btn btn-link text-danger m-0 p-0">
                                                <i class="bi bi-x-lg"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script setup lang="ts">

import { reactive, onMounted, ref, onUnmounted } from 'vue'
import { MaterialsAPI, ArchiveAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
import type { Header, Item, SortType } from "vue3-easy-data-table";
import editMaterialModal from './_includes/modals/editMaterial.vue';
import createPINModal from './_includes/modals/createPINModal.vue';
import PageLoading from '@/components/PageLoading.vue';



const material_api = new MaterialsAPI()
const archive_api = new ArchiveAPI()
const fxn = useFunction.fx
const archivesList = ref<any>([])

onMounted(() => {
    getCategories()
    getMaterials()
    getPins()
    getArchives()
})


// ######## FORM START ############# //
const cateDropDown = ref<any>([])
const inputFileEl = ref<any>(null)

const form = reactive({
    doc: '',
    name: '',
    pages: '',
    published: '',
    category_id: '',
    isSaving: false
})

function grabFile(e: any) {
    form.doc = e.target.files[0]
}

async function getArchives() {
    try {
        let resp = await archive_api.list();
        archivesList.value = resp.data
        // console.log(resp);
    } catch (error) {
        // 
    }
}


async function getCategories() {
    let { data } = await material_api.getCategories()
    let arr = data
    if (arr.length) {
        arr = arr.sort((a: any, b: any) => a.category_name.localeCompare(b.category_name))
    }
    cateDropDown.value = arr
}

async function submitForm() {
    if (!form.name || !form.pages || !form.category_id) {
        fxn.Toast('Please complete the fields', 'warning')
        return
    }

    if (!form.doc) {
        fxn.Toast('No Material included', 'warning')
        return
    }

    const obj = new FormData();
    obj.append('name', form.name);
    obj.append('pages', form.pages);
    obj.append('category_id', form.category_id);
    obj.append('doc', form.doc);
    // obj.append('published', form.published);

    form.isSaving = true

    try {
        let resp = await material_api.addNew(obj)
        if (resp.status == 203) {
            fxn.Toast('Name already exists', 'warning')
            form.isSaving = false
            return
        }
        form.category_id = ''
        form.name = ''
        form.pages = ''
        form.doc = ''
        form.published = ''
        inputFileEl.value.value = ''

        fxn.Toast('Added Successfully', 'success')
        form.isSaving = false
        getMaterials()
        // window.scrollTo(0, 0)
    } catch (error) {
        // console.log(error);

        form.isSaving = false
        fxn.Toast('Network error', 'error')
    }


}
// ######## FORM END ############# //




// ######## MATERIALS TABLE START ############# //

async function getMaterials() {
    let { data } = await material_api.listForAdmin()
    materials.value = data
    materialsLoading.value = false
}


const sortBy: string = "name";
const sortType: SortType = "asc";

const selected = ref([])
const searchField = ["name", "category", "material_code"];
const searchValue = ref('');


const headers: Header[] = [
    { text: "MATERIAL_ID", value: "material_code" },
    { text: "NAME", value: "name", sortable: true },
    { text: "CATEGORY", value: "category" },
    { text: "DOWNLOADS", value: "no_of_downloads" },
    { text: "ACCESS", value: "pin" },
    { text: "", value: "operation" },
];


const materials = ref<Item[]>([])
const materialsLoading = ref<boolean>(true)
const materialToEdit = ref<any[]>([])

function editMaterial(item: any) {
    materialToEdit.value = item
}

function deleteMaterial(item: any) {
    fxn.Confirm(`Delete this Material?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                try {
                    let resp = await material_api.remove(item.material_id)
                    if (resp.status == 200) {
                        getMaterials();
                        fxn.Toast('Record Deleted', 'success')
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }
            }
        })
}





function materialToArchive(newArchive: any) {
    fxn.Confirm(`Move to Archive?`, 'Continue')
        .then(async (result) => {
            if (result.isConfirmed) {

                let ids = selected.value.map((x: any) => x.material_id)
                let materialsStr = ids.toString();

                let obj = {
                    op_type: 'add',
                    archive_id: newArchive,
                    material_ids: materialsStr,
                }

                try {
                    let resp = await archive_api.materialToArchive(obj)
                    if (resp.status == 200) {
                        getMaterials()
                        selected.value = []
                        fxn.Toast('material(s) moved to archive', 'success')
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }
            }
        })


}





// ######## MATERIALS TABLE END ############# //




// ######## PINS START ############# //
const active_pins = ref<any>([])
const material_id_forNewPIN = ref<string>('')

async function getPins() {
    let { data } = await material_api.view_pins()
    active_pins.value = data
    // console.log(data);

}

async function deletePin(id: any) {
    try {
        await material_api.delete_pin(id)
        getPins()
    } catch (error) {
        fxn.Toast('Internet error', 'error')
    }
}

let interval = setInterval(() => {
    getPins()
}, 10000)

onUnmounted(() => {
    clearInterval(interval)
})
// ######## PINS END ############# //
</script>


<style scoped>
.operation-icon {
    cursor: pointer;
}
</style>


<style >
.vue3-easy-data-table__header th.sortable .multi-sort__number {
    border-radius: 0%;
    height: 1.5em;
    width: 1.5em;
    line-height: 1.5em;
    margin-left: 4px;
    background-color: var(--easy-table-header-font-color);
    color: var(--easy-table-header-background-color);
    /* display: none; */
}

.easy-checkbox input[type=checkbox]:checked+label:before {
    background: #111 !important;
    /* background: red !important; */
}

/* .easy-checkbox input[type=checkbox].allSelected+label:before, */
.easy-checkbox input[type=checkbox].partSelected+label:before {
    background: var(--bs-warning) !important;
}

.vue3-easy-data-table__main {
    min-height: 300px !important;
}
</style>