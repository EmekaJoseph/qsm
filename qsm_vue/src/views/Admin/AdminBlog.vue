<template>
    <div class="row g-3">

        <!-- NEW BLOG FORM ###################################### -->
        <div class="col-md-5">
            <div class="card rounded-4 h-100">
                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    New Blog
                </div>
                <div class="card-body">

                    <form ref="fileForm" class="d-none">
                        <input type="file" ref="fileBtn" accept="image/jpeg, image/png, image/jpg"
                            class="form-control form-control-lg" @change="fileUploadFn">
                    </form>

                    <div class="row g-2">
                        <div @submit.prevent class="row g-2">
                            <div class="col-12">
                                <label>Title</label>
                                <textarea v-model="form.title" rows="2" class="form-control"></textarea>
                            </div>
                            <div class="col-12" style="margin-bottom: 50px; height:300px">
                                <label>Body</label>
                                <!-- <textarea v-model="form.body" rows="10" class="form-control"></textarea> -->
                                <QuillEditor placeholder="type here.." content-type="html" toolbar="minimal"
                                    v-model:content="form.body" />
                            </div>
                            <div class="col-12 mt-4">
                                <label>Category</label>
                                <input v-model="form.category" type="text" class="form-control" />
                            </div>

                            <div v-if="fileURL" class="col-12 mt-3">
                                <span v-if="newFile" @click="fileFormR"
                                    class="small cursor-pointer fw-bold float-end text-black">
                                    <i class="bi bi-x-circle-fill"></i> Remove
                                </span>
                                <div class="imagePreviewWrapper" :style="{ 'background-image': `url(${fileURL})` }">
                                </div>
                            </div>

                            <div class="col-lg-12 mt-3">
                                <div @click="fileBtn.click()" v-if="!newFile" class="fileBtnFake">
                                    <i class="bi bi-file-earmark-text"></i> Add optional Image
                                </div>
                            </div>

                            <div class="col-12 mt-4">
                                <button v-if="!form.isSaving" @click="submit"
                                    class="btn theme-btn w-100 btn-lg">Save</button>
                                <button v-else disabled class="btn theme-btn w-100 btn-lg">Saving..</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- BLOG TABLE ###################################### -->
        <div class="col-md-7">
            <div class="card rounded-4 h-100">

                <div class="card-header bg-transparent fw-bold  border-0 p-3">
                    Blog List <span class="small"> ({{ blogList.length }})</span>
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
                                <div v-if="blogList.length > 10" class="col-lg-12">
                                    <div class="float-end">
                                        <label>&nbsp;</label>
                                        <input placeholder="search.." type="text" class="form-control"
                                            v-model="searchValue">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 list-scrol">
                            <EasyDataTable alternating :headers="headers" :items="blogList" show-index buttons-pagination
                                :search-field="searchField" :search-value="searchValue">

                                <template #item-operation="item">
                                    <div class="operation-wrapper">
                                        <span @click="editBlog(item.blog_id)" class="me-4 operation-icon">
                                            <i class="bi bi-pencil"></i>
                                        </span>
                                        <span @click="deleteBlog(item.blog_id)" class="operation-icon">
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
        <editBlogModal :item="blogToEdit" @done="getBlogs" />
        <button class="d-none" data-bs-toggle="modal" data-bs-target="#editBlog" ref="openModalBtn"></button>
    </div>
</template>

<script setup lang="ts">

import { onMounted, reactive, ref } from 'vue'
import { BlogAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';
import type { Header, Item, } from "vue3-easy-data-table";
import editBlogModal from './_includes/modals/editBlog.vue';
import { fileUploader } from '@/store/functions/fileUploader'

const blog_api = new BlogAPI()
const fxn = useFunction.fx

const blogList = ref<Item[]>([])
const listIsLoading = ref<boolean>(false)


onMounted(() => {
    listIsLoading.value = true
    getBlogs()
})



// ######## BLOG TABLE START ############# //
async function getBlogs() {
    let { data } = await blog_api.list()
    blogList.value = data
    listIsLoading.value = false
}

const searchField = ["title", "category"];
const searchValue = ref('');


const headers: Header[] = [
    { text: "TITLE", value: "title" },
    { text: "", value: "created" },
    { text: "CATEGORY", value: "category" },
    { text: "", value: "operation" },
];

const blogToEdit = ref<any[]>([])
const openModalBtn = ref<any>(null)

async function editBlog(blog_id: any) {
    let { data } = await blog_api.blogDetails(blog_id)
    console.log(data);

    blogToEdit.value = data
    openModalBtn.value.click()
}

function deleteBlog(blog_id: any) {
    fxn.Confirm(`Delete this Blog?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                try {
                    let resp = await blog_api.remove(blog_id)
                    if (resp.status == 200) {
                        getBlogs();
                        fxn.Toast('Record Deleted', 'success')
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }
            }
        })
}

// ######## BLOG TABLE END ############# //


// ######## NEW BLOG START ############# //
let { fileUploadFn, fileURL, newFile, } = fileUploader();
const fileBtn = ref<any>(null);
const fileForm = ref<any>(null);

function fileFormR() {
    fileURL.value = ''
    newFile.value = ''
    fileForm.value.reset()
}

const form = reactive({
    title: '',
    body: '',
    category: '',
    isSaving: false
})


async function submit() {
    if (!form.title) {
        fxn.Toast('Title is required', 'warning')
        return
    }
    if (!form.body) {
        fxn.Toast('Blog has no body', 'warning')
        return
    }

    let newForm = new FormData();

    newForm.append('title', form.title);
    newForm.append('body', form.body);
    let $category: any = !form.category ? '' : form.category
    newForm.append('category', $category);
    if (newFile.value) newForm.append('image', newFile.value);

    form.isSaving = true
    try {
        let resp = await blog_api.create(newForm)
        if (resp.status == 203) {
            fxn.Toast('Title already exists', 'warning')
            return;
        }
        form.isSaving = false
        form.title = form.body = form.category = ''
        fileFormR()
        fxn.Toast('Added SuccessFully', 'warning')
        getBlogs()
    } catch (error) {
        form.isSaving = false
        fxn.Toast('Network Error', 'error')
        // 
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




.imagePreviewWrapper {
    background-repeat: no-repeat;
    width: auto;
    min-height: 200px;

    background-size: contain;

}


.fileBtnFake {
    background-color: var(--bs-light);
    padding: 10px;
    border: 1px solid #e0dede;
    cursor: pointer;
    font-weight: bold;
    border-radius: 10px;
}

.fileBtnFake:hover {
    background-color: #eee;
    /* color: var(--theme-color); */
}
</style>