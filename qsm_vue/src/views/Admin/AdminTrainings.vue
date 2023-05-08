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
                                <textarea v-model="form.title" class="form-control" rows="2"></textarea>
                            </div>

                            <div class="col-md-12" style="margin-bottom: 100px; height: 250px">
                                <label>Training Info:</label>
                                <!-- <textarea v-model="form.info" class="form-control" rows="10"></textarea> -->
                                <QuillEditor placeholder="type here.." content-type="html" toolbar="minimal"
                                    v-model:content="form.info" />
                            </div>

                            <div class="col-md-12">
                                <label>Training Venue:</label>
                                <textarea v-model="form.venue" class="form-control " rows="2"></textarea>
                            </div>

                            <div class="col-md-6">
                                <label>Start Date:</label>
                                <input v-model="form.start_date" type="date" :min="form.today" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>End Date:</label>
                                <input v-model="form.end_date" type="date" :min="form.start_date" class="form-control">
                            </div>

                            <div class="col-md-12">
                                Image (optional)
                                <input ref="inputFileEl" @change="grabFile" type="file"
                                    accept="image/jpeg, image/png, image/jpg" class="form-control form-control-lg">
                            </div>

                            <div class="col-md-12 mt-4">
                                <button v-if="!form.isSaving" type="submit"
                                    class="btn btn-custom-secondary btn-lg  float-end w-100">Submit</button>
                                <button v-else class="btn btn-custom-secondary btn-lg  float-end w-100"
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
                                <table class="table table-sm text-muted">
                                    <tbody>
                                        <tr v-for="(trn, index) in Trainings.active " :key=index>
                                            <td class="">
                                                <span class="fw-bold text-capitalize">{{ trn.title }}</span>
                                                <div class="small text-muted">
                                                    {{ reglink(trn.id) }}
                                                </div>
                                                <button @click="copy(reglink(trn.id))"
                                                    class="btn btn-sm m-0 p-0 px-1 text-success bg-success-subtle">
                                                    copy link
                                                </button>
                                            </td>
                                            <td style="width: 5%;">
                                                <div class="dropdown">
                                                    <button
                                                        class="btn p-0 bg-light-subtle px-2 m-0 btn-link text-black dropdown-toggle"
                                                        type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="bi bi-three-dots"></i>
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
                        Previous Trainings:</div>
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
                                                <button @click="getRegList(trn.id)"
                                                    class="btn btn-small text-dark  m-0 p-0">
                                                    <i class="bi bi-journal-text"></i> list
                                                </button>
                                            </td>

                                            <td>
                                                <button @click="deleteTraining(trn.id)"
                                                    class="btn btn-small text-danger  m-0 p-0">
                                                    <i class="bi bi-trash3"></i> delete
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

        <!-- modals ################################################ -->
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
import { useClipboard } from '@vueuse/core'

const { copy } = useClipboard()

onMounted(() => {
    Trainings.loading = true
    getList()
})

async function getList() {
    let { data } = await training_api.list()
    console.log(data);

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
    start_date: new Date().toISOString().split('T')[0],
    end_date: new Date().toISOString().split('T')[0],
    today: new Date().toISOString().split('T')[0],
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

const reglink = (id: any) => {
    return `${window.location.origin}/booktraining?trn=${id}`
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