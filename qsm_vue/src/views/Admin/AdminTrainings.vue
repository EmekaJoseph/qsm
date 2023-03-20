<template>
    <div>
        <div class="row justify-content-center gy-3">


            <!-- FORM ################################################# -->
            <div class="col-lg-5">
                <div class="card rounded-4 h-100">
                    <div class="card-header bg-transparent fw-bold  border-0 p-3">
                        Add Training:
                    </div>
                    <div class="card-body px-4">
                        <form @submit.prevent="submitForm" class="row gy-3">
                            <div class="col-md-12">
                                <label>Training Title:</label>
                                <input v-model="form.title" type="text" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <label>Training Info:</label>
                                <textarea v-model="form.info" class="form-control" rows="4"></textarea>
                            </div>

                            <div class="col-md-12">
                                <label>Training Venue:</label>
                                <input v-model="form.venue" type="text" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>Start Date:</label>
                                <input v-model="form.start_date" type="date" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>End Date:</label>
                                <input v-model="form.end_date" type="date" class="form-control">
                            </div>

                            <div class="col-md-12">
                                Image (optional)
                                <input ref="inputFileEl" @change="grabFile" type="file"
                                    accept="image/jpeg, image/png, image/jpg" class="form-control">
                            </div>

                            <div class="col-md-12 mt-4">
                                <button v-if="!form.isSaving" type="submit"
                                    class="btn btn-custom-secondary  float-end w-100">Submit</button>
                                <button v-else class="btn btn-custom-secondary  float-end w-100"
                                    disabled>Submitting...</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <!-- ACTIVE TRAININGS ################################################# -->
            <div class="col-lg-7">
                <div class="card rounded-4 h-100">
                    <div class="card-header bg-transparent fw-bold  border-0 p-3"> <i
                            class="bi bi-circle-fill text-success xsmall"></i>
                        Active Trainings <span class="small"> ({{ Trainings.active.length }}) </span>
                    </div>
                    <div class="card-body px-4">

                        <div v-if="Trainings.loading">
                            <PageLoading />
                        </div>

                        <div v-else>

                            <div class="py-5" style="min-height: 300px;" v-if="!Trainings.active.length">
                                <EmptyListComponent str="No Trainings" />
                            </div>

                            <div v-else class="table-responsive list-scroll">
                                <table class="table">
                                    <tbody>
                                        <tr v-for="(trn, index) in Trainings.active " :key=index>
                                            <th>{{ (index + 1) }}</th>
                                            <td>{{ trn.title }}</td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn p-0 m-0 btn-link text-black dropdown-toggle"
                                                        type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="bi bi-three-dots-vertical"></i>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li v-if="trn.reg_count != '0'">
                                                            <button @click="getRegList(trn.id)"
                                                                class="btn btn-sm  dropdown-item">
                                                                <i class="bi bi-journal-text"></i> Registrations
                                                            </button>
                                                        </li>
                                                        <li>
                                                            <button @click="Trainings.toEdit = trn" data-bs-toggle="modal"
                                                                data-bs-target="#editTraining"
                                                                class="btn btn-sm text-dark dropdown-item">
                                                                <i class="bi bi-pencil"></i> Edit
                                                            </button>
                                                        </li>
                                                        <li>
                                                            <button @click="deleteTraining(trn.id)"
                                                                class="btn btn-sm text-danger dropdown-item">
                                                                <i class="bi bi-trash3"></i> Delete
                                                            </button>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- PAST TRAININGS ################################################# -->
            <div class="col-lg-12">
                <div class="card bg-white rounded-4 h-100">
                    <div class="card-header bg-transparent fw-bold  border-0"> <i
                            class="bi bi-circle-fill text-muted2 xsmall"></i>
                        Past Trainings</div>
                    <div class="card-body">

                        <div v-if="Trainings.loading">
                            <PageLoading />
                        </div>

                        <div v-else>

                            <div class="py-5" style="min-height: 300px;" v-if="!Trainings.inActive.length">
                                <EmptyListComponent str="List Empty" />
                            </div>

                            <div v-else class="table-responsive list-scroll">
                                <table class="table">
                                    <tbody>
                                        <tr v-for="(trn, index) in Trainings.inActive " :key=index>
                                            <th>{{ (index + 1) }}</th>
                                            <td>{{ trn.title }}</td>


                                            <td>
                                                <button @click="deleteTraining(trn.id)"
                                                    class="btn btn-small text-danger  m-0 p-0">
                                                    <i class="bi bi-trash3"></i>
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
        <editTraining :item="Trainings.toEdit" @done="getList" />
        <regList :list="Trainings.regList" />
        <button data-bs-toggle="modal" data-bs-target="#regList" ref="openListBtn" class="d-none"></button>
    </div>
</template>

<script setup lang="ts">
import { reactive, onMounted, ref, onUnmounted } from 'vue'
import useFunction from '@/store/functions/useFunction';
import { TrainingsAPI } from '@/store/functions/axiosManager';
import editTraining from './_includes/modals/editTraining.vue';
import regList from './_includes/modals/regList.vue';


onMounted(() => {
    Trainings.loading = true
    getList()
})

async function getList() {
    let { data } = await training_api.list()
    Trainings.active = data.active;
    Trainings.inActive = data.inActive;
    Trainings.loading = false
}

const Trainings: any = reactive({
    loading: true,
    active: [],
    inActive: [],
    toEdit: {},
    regList: []
})

const fxn = useFunction.fx
const training_api = new TrainingsAPI()
const inputFileEl = ref<any>(null)
const openListBtn = ref<any>(null)


const form: any = reactive({
    title: '',
    info: '',
    venue: '',
    start_date: '',
    end_date: '',
    image: '',
    isSaving: false
})

function grabFile(e: any) {
    form.image = e.target.files[0]
}


async function submitForm() {
    if (!form.title || !form.venue || !form.info || !form.start_date || !form.end_date) {
        fxn.Toast('Please complete the fields', 'warning')
        return
    }

    if (!(form.start_date <= form.end_date)) {
        fxn.Toast('invalid date duration', 'warning')
        return;
    }

    const obj = new FormData();
    obj.append('title', form.title);
    obj.append('venue', form.venue);
    obj.append('info', form.info);
    obj.append('start_date', form.start_date);
    obj.append('end_date', form.end_date);
    if (form.image)
        obj.append('image', form.image);


    form.isSaving = true
    try {
        let resp = await training_api.addNew(obj)
        if (resp.status == 203) {
            fxn.Toast('Title already exists', 'warning')
            form.isSaving = false
            return
        }

        form.title = ''
        form.info = ''
        form.end_date = ''
        form.start_date = ''
        form.venue = ''
        form.image = ''
        fxn.Toast('Added Successfully', 'success')
        form.isSaving = false
        inputFileEl.value.value = ''
        getList()
        window.scrollTo(0, 0)


    } catch (error) {
        fxn.Toast('Internet Error', 'error')
        form.isSaving = false
    }
}


async function getRegList(id: any) {
    let { data } = await training_api.registrationList(id)
    Trainings.regList = data
    openListBtn.value.click()
}



async function deleteTraining(id: any) {
    fxn.Confirm(`Delete this Record?`, 'Yes, Delete')
        .then(async (result) => {
            if (result.isConfirmed) {
                try {
                    let resp = await training_api.remove(id)
                    if (resp.status == 200) {
                        getList();
                        fxn.Toast('Record Deleted', 'success')
                    }
                } catch (error) {
                    fxn.Toast('internet error', 'error')
                }


            }
        })
}


let interval = setInterval(() => {
    getList()
}, 10000)

onUnmounted(() => {
    clearInterval(interval)
})



</script>

<style scoped>
.dropdown-toggle::after {
    display: none;
}
</style>