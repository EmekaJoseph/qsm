<template>
    <div>
        <div class="modal fade" id="editBlog" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-light">
                        <!-- <span class="fw-bold">{{ item.name }}</span> -->
                        <span class="fw-bold">Edit:</span>
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div class="row justify-content-center gy-3">
                            <div class="col-md-12">
                                <div v-if="item.image" class="image-holder fill">
                                    <img class="img-fluid" :src="item.image" alt="blog image">
                                </div>
                            </div>
                            <div class="col-md-12 ">
                                <form class="row g-3">
                                    <div class="col-md-12">
                                        <label>Title:</label>
                                        <textarea v-model="thisItem.title" class="form-control" rows="2"></textarea>
                                    </div>
                                    <div class="col-md-12" style="margin-bottom: 70px;">
                                        <label>Body:</label>
                                        <QuillEditor content-type="html" toolbar="minimal"
                                            v-model:content="thisItem.body" />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Category:</label>
                                        <input v-model="thisItem.category" type="text" class="form-control">
                                    </div>


                                    <div class="col-md-12">
                                        <span v-if="item.image">Change Image:</span>
                                        <span v-else>Add Image:</span>
                                        <input ref="inputFileEl" @change="grabFile" type="file"
                                            accept="image/jpeg, image/png, image/jpg" class="form-control">
                                    </div>

                                    <div class="col-md-12 mt-3">
                                        <button v-if="!isSaving" @click.prevent="updateDetails"
                                            class="float-end theme-btn btn-custom-secondary btn">
                                            Update
                                        </button>
                                        <button v-else class="float-end theme-btn btn" disabled>Updating...</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, watchEffect } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
import useFunction from '@/store/functions/useFunction';
import { BlogAPI } from '@/store/functions/axiosManager';
import { QuillEditor } from '@vueup/vue-quill';

const fxn = useFunction.fx
const isSaving = ref(false)
const emit = defineEmits(['done'])
const blog_api = new BlogAPI()
const inputFileEl = ref<any>(null)

const prop = defineProps({
    item: {
        type: Object,
        required: true
    }
})

const thisItem = reactive({
    title: prop.item.title,
    body: prop.item.body,
    category: prop.item.category,
    image: '',
})

watchEffect(() => {
    thisItem.title = prop.item.title
    thisItem.body = prop.item.body
    thisItem.category = prop.item.category
})

function grabFile(e: any) {
    thisItem.image = e.target.files[0]
}


async function updateDetails() {
    if (!thisItem.title || !thisItem.body) {
        fxn.Toast('compulsory fields are empty', 'warning')
        return;
    }

    const obj = new FormData();
    obj.append('title', thisItem.title);
    obj.append('body', thisItem.body);
    let $category: any = !thisItem.category ? '' : thisItem.category
    obj.append('category', $category);
    if (thisItem.image)
        obj.append('image', thisItem.image);

    isSaving.value = true

    try {
        let resp = await blog_api.updateBlog(prop.item.blog_id, obj)
        console.log(resp);
        if (resp.status == 203) {
            fxn.Toast('Title already exists', 'warning')
            isSaving.value = false
            return
        }
        fxn.Toast('updated', 'success')
        emit('done')
        isSaving.value = false
        btnX.value.click()
        inputFileEl.value.value = ''
    } catch (error) {
        fxn.Toast('internet error', 'error')
        isSaving.value = false
    }

}


const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>

<style scoped>
.info-panel {
    padding: 10px;
    border: none;
    background-color: var(--theme-color-bg);
    border-radius: 0%;
}

.image-holder {
    /* cursor: pointer; */
    transition: all 0.5s ease;
    height: 150px;
    width: auto;
}

.fill {
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden
}

.fill img {
    flex-shrink: 0;
    min-width: 100%;
    min-height: 100%
}
</style>

