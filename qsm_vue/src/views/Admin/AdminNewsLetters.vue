<template>
    <div class="row g-3">

        <!-- NEW BLOG FORM ###################################### -->
        <div class="col-md-5">
            <div class="card rounded-4 h-100">
                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    Upload New:
                </div>
                <div class="card-body">

                    <div class="row g-2">
                        <div @submit.prevent class="row g-2">
                            <div class="col-12">
                                <label>Title:</label>
                                <textarea v-model="form.title" rows="2" class="form-control"></textarea>
                            </div>

                            <div class="col-12 mt-4">
                                Newsletter File:
                                <input ref="inputFileEl" @change="grabFile" type="file"
                                    accept=".doc, .docx, application/msword, .pdf, .txt, .xlsx, .xls, .pptx, .ppt"
                                    class="form-control">
                            </div>

                            <div class="col-12 mt-4">
                                <button v-if="!form.isSaving" @click="submitForm"
                                    class="btn theme-btn w-100 btn-lg">Save</button>
                                <button v-else disabled class="btn theme-btn w-100 btn-lg">Saving..</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- TABLE ###################################### -->
        <div class="col-md-7">
            <div class="card rounded-4 h-100">

                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    List <span class="small"> ({{ listToShow.length }})</span>
                    <!-- <span class=" float-end">
                        <button class="btn btn-dark text-dark btn-custom-secondary btn-sm p-0 px-1">
                            <i class="bi bi-newspaper"></i> New Blog
                        </button>
                    </span> -->
                </div>
                <div class="card-body">
                    <div class=" min-vh-100" v-if="listIsLoading">
                        <PageLoading />
                    </div>
                    <div v-else class="row gy-3">
                        <div class="col-12">
                            <div class="row gy-1">
                                <div v-if="listToShow.length > 10" class="col-lg-12">
                                    <div class="float-end">
                                        <label>&nbsp;</label>
                                        <input placeholder="search.." type="text" class="form-control"
                                            v-model="searchValue">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 list-scrol">
                            <EasyDataTable alternating :headers="headers" :items="listToShow" show-index buttons-pagination
                                :search-field="searchField" :search-value="searchValue">

                                <template #item-operation="item">
                                    <div class="operation-wrapper">
                                        <span @click="edit(item.id)" class="me-4 operation-icon">
                                            <i class="bi bi-pencil"></i>
                                        </span>
                                        <span @click="removeFromList(item.id)" class="operation-icon">
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

        <!-- MODAL ######################################### -->
        <editNewsLetterModal :item="ToEdit" @done="getList" />
        <button class="d-none" data-bs-toggle="modal" data-bs-target="#editBlog" ref="openModalBtn"></button>
    </div>
</template>

<script setup lang="ts">
import { onMounted, reactive, ref } from 'vue'
import { NewsLetterAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
import type { Header, Item, } from "vue3-easy-data-table";
import editNewsLetterModal from './_includes/modals/editNewsLetter.vue';

const nLetter_api = new NewsLetterAPI()
const fxn = useFunction.fx

const listToShow = ref<Item[]>([])
const listIsLoading = ref<boolean>(false)

onMounted(() => {
    listIsLoading.value = true
    getList()
})

// ######## TABLE START ############# //
async function getList() {
    let { data } = await nLetter_api.list()
    listToShow.value = data
    listIsLoading.value = false
}

const searchField = ["title", "category"];
const searchValue = ref('');

const headers: Header[] = [
    { text: "TITLE", value: "title" },
    { text: "", value: "created" },
    // { text: "CATEGORY", value: "category" },
    { text: "", value: "operation" },
];

const ToEdit = ref<any[]>([])
const openModalBtn = ref<any>(null)

async function edit(id: any) {
    let { data } = await nLetter_api.details(id)
    ToEdit.value = data
    openModalBtn.value.click()
}

function removeFromList(id: any) {
    fxn.Confirm(`Confrim Delete?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                try {
                    let resp = await nLetter_api.remove(id)
                    console.log(resp);

                    if (resp.status == 200) {
                        getList();
                        fxn.Toast('Record Deleted', 'success')
                    }
                } catch (error) {
                    console.log(error);

                    fxn.Toast('internet error', 'error')
                }
            }
        })
}

// ######## TABLE END ############# //


// ######## NEW  START ############# //

const inputFileEl = ref<any>(null)

const form = reactive({
    title: '',
    category: '',
    isSaving: false,
    doc: ''
})

function grabFile(e: any) {
    form.doc = e.target.files[0]
}


async function submitForm() {
    if (!form.title) {
        fxn.Toast('Please add Title', 'warning')
        return
    }

    if (!form.doc) {
        fxn.Toast('No document included', 'warning')
        return
    }

    const obj = new FormData();
    obj.append('title', form.title);
    obj.append('doc', form.doc);
    // obj.append('published', form.published);

    form.isSaving = true

    try {
        let resp = await nLetter_api.create(obj)
        if (resp.status == 203) {
            fxn.Toast('Name already exists', 'warning')
            form.isSaving = false
            return
        }
        form.title = ''
        form.doc = ''
        inputFileEl.value.value = ''

        fxn.Toast('Added Successfully', 'success')
        form.isSaving = false
        getList()
        // window.scrollTo(0, 0)
    } catch (error) {
        console.log(error);

        form.isSaving = false
        fxn.Toast('Network error', 'error')
    }


}
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