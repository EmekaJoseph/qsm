<template>
    <div class="card border-0 bg-white rounded-4 h-100">
        <div class="card-header bg-transparent fw-bold  border-0 p-3">
            <i class="bi bi-tag"></i> Materials Categories ({{ categories.list.length }})
            <span v-if="categories.isEditing" @click="cancelEditing()" style="cursor: pointer;"
                class="float-end text-danger small">Cancel</span>
        </div>
        <div class="card-body px-4">
            <form v-if="!categories.isEditing" @submit.prevent="saveCategory" class="row g-2">
                <div class="col-12 col-md-8">
                    <input v-model="categories.field" type="text" class="form-control" placeholder="new category..">
                </div>
                <div class="col-12 col-md-4">
                    <button class="btn btn-custom-secondary w-100">
                        Add
                    </button>
                </div>
            </form>

            <form v-else @submit.prevent="updateCategory" class="row g-2">
                <div class="col-12 col-md-8">
                    <input v-model="categories.editObj.category_name" type="text" class="form-control form-control-lg">
                </div>
                <div class="col-12 col-md-4">
                    <button class="btn btn-warning bg-warning-subtle w-100 btn-lg">
                        Rename
                    </button>
                </div>
            </form>


            <div class="mt-3 card p-3 ">
                <div v-if="categories.loading">
                    <PageLoading />
                </div>

                <div v-else class="table-responsive list-scroll">
                    <table class="table table-sm">
                        <tbody>
                            <tr v-for="(cate, index) in categories.list" :key="index">
                                <th>{{ (index + 1) }}.</th>
                                <td>{{ cate.category_name }}</td>
                                <td class=" hover-tiltY">
                                    <button @click="editCategory(cate)" class="btn btn-sm text-success m-0 p-0">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                </td>
                                <td class="hover-tiltY">
                                    <button @click="deleteCategory(cate.category_id)"
                                        class="btn btn-sm text-danger m-0 p-0">
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
</template>

<script setup lang="ts">
import { reactive, onMounted } from 'vue'
import { MaterialsAPI } from '@/store/functions/axiosManager';
import useFunction from '@/store/functions/useFunction';

const material_api = new MaterialsAPI()
const fxn = useFunction.fx

const categories: any = reactive({
    loading: false,
    list: [],
    field: '',
    isEditing: false,
    editObj: {}
})

onMounted(() => {
    categories.loading = true
    loadCategories()
})

async function loadCategories() {
    let { data } = await material_api.getCategories()
    let arr = data
    if (arr.length) {
        arr = arr.sort((a: any, b: any) => a.category_name.localeCompare(b.category_name))
    }

    categories.list = arr
    categories.loading = false
}

async function saveCategory() {
    if (categories.field) {
        try {
            let resp = await material_api.addCategory({ category_name: categories.field })
            if (resp.status == 200) {
                fxn.Toast('Added Successfully', 'success')
                categories.field = ''
                loadCategories();
            }
        } catch (error) {
            fxn.Toast('internet error', 'error')
        }

    }
}

function editCategory(cate: any) {
    categories.isEditing = true
    categories.editObj = cate
}

function cancelEditing() {
    categories.isEditing = false
    categories.editObj = {}
}

async function updateCategory() {
    let obj = {
        category_id: categories.editObj.category_id,
        category_name: categories.editObj.category_name,
    }
    try {
        let resp = await material_api.renameCategory(obj)
        if (resp.status == 200) {
            loadCategories();
            fxn.Toast('Updated', 'success')
            cancelEditing()
        }
    } catch (error) {
        fxn.Toast('internet error', 'error')
        cancelEditing()
    }
}

async function deleteCategory(id: any) {
    fxn.Confirm(`Delete this Record?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                try {
                    let resp = await material_api.deleteCategory(id)
                    if (resp.status == 200) {
                        loadCategories();
                        fxn.Toast('Record Deleted', 'success')
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }
            }
        })
}

</script>
