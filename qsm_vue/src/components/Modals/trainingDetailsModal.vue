<template>
    <div>
        <div class="modal fade" id="trainingDetailsModal" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0 bg-white text-black">
                        <span class="fw-bold">{{ item.title }}</span>
                        <!-- <span class="fw-bold">Head</span> -->
                        <span class="float-end">
                            <button ref="btnX" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </span>
                    </div>
                    <div class="modal-body p-sm-4">
                        <div class="row justify-content-center gy-3">
                            <div class="col-md-12">
                                <div v-if="item.image" class="image-holder fill">
                                    <img class="img-fluid" :src="`${hostURL}/trainings/${item.image}`" alt="QSM-Training">
                                </div>
                            </div>
                            <div class="col-md-12 ">
                                <div class="bg-light p-3 rounded-3">
                                    <div class="text-black my-2">
                                        <div class="fw-bold">Description:</div>
                                        {{ item.desc }}
                                    </div>

                                    <div class="text-black mb-2">
                                        <div class="fw-bold">Venue:</div>
                                        {{ item.venue }}
                                    </div>

                                    <!-- <div class="text-black mb-2">
                                        <div class="fw-bold">Venue:</div>
                                        {{ item.venue }}
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer border-0">
                        <div class="container">

                            <div class="col-12">
                                <div class="row">
                                    <div class="col-8">
                                        <button v-if="!item.inCart" @click="item.inCart = !item.inCart"
                                            class="btn btn-lg btn-custom-secondary w-100" data-bs-dismiss="modal">
                                            <i class="bi bi-cart-plus"></i> Add to Cart
                                        </button>

                                        <button v-else @click="item.inCart = !item.inCart"
                                            class="btn btn-lg btn-danger bg-danger-subtle text-dark w-100"
                                            data-bs-dismiss="modal">
                                            <i class="bi bi-cart-x"></i> Remove
                                        </button>
                                    </div>
                                    <div class="col-4">
                                        <button data-bs-dismiss="modal"
                                            class="w-100 btn btn-link text-decoration-none text-black bg-light-subtle btn-lg">close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { computed, ref, } from 'vue';
import { onBeforeRouteLeave } from 'vue-router';
import { hostURL } from '@/store/functions/axiosInstance';
import { useTrainings } from '@/store/trainings'

const trainings = useTrainings()

const item = computed(() => {
    return trainings.detailsShow
})



// defineProps({
//     item: {
//         type: Object,
//         // eslint-disable-next-line vue/require-valid-default-prop
//         default: {},
//         required: true
//     }
// })


const btnX: any = ref(null)
onBeforeRouteLeave(() => {
    btnX.value.click()
})
</script>

<style scoped>
/* .image-holder {
    cursor: pointer;
    transition: all 0.5s ease;
    height: 300px;
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
} */
</style>

