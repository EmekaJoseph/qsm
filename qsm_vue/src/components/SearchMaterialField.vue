<template>
    <div>
        <!-- DESKTOP START ################################# -->
        <div class="d-none d-sm-block">
            <div class="col-md-12">
                <form @submit.prevent="sendToParent" class="input-group">
                    <input type="text" v-model="str" class="form-control" placeholder="search material">
                    <span @click="sendToParent" class="input-group-text p-lg-2 px-4">
                        <i class="bi bi-search me-lg-3 hover-tiltY"></i>
                    </span>
                </form>
            </div>
        </div>
        <!-- DESKTOP END ###########################-->


        <!-- MOBILE START ######################################## -->
        <div class="fixed-bottom-btn d-sm-none">
            <div class="justify-content-end floatPanel" data-bs-toggle="offcanvas" data-bs-target="#searchOffcanvas">
                <span class=" shadow animate__heartBeat animate__infinite animate__slower">
                    <i class="bi bi-search text-white"></i>
                </span>

            </div>
        </div>


        <div class="offcanvas offcanvas-bottom" tabindex="-1" id="searchOffcanvas" aria-labelledby="offcanvasLabel">
            <div class="offcanvas-header pb-0">
                <h6 class="offcanvas-title text-muted2 fw-light small" id="offcanvasLabel">Search Materials</h6>
                <button ref="btnCloseCanvas" type="button" class="btn-close" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <form @submit.prevent="sendToParent" class="row gy-3">
                    <div class="col-sm-8">
                        <input v-model="str" type="text" class="form-control cnvasSearch" placeholder="enter name..">
                    </div>
                    <div class="col-sm-8">
                        <button @click.prevent="sendToParent"
                            class="btn btn-link text-decoration-none fw-bold text-uppercase text-black float-end">
                            Search <i class="bi bi-arrow-right"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- MOBILE END ############################### -->

    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
const emit = defineEmits(['submit'])
const str = ref<string>('')
const btnCloseCanvas = ref<any>(null)

function sendToParent() {
    btnCloseCanvas.value.click()
    if (str.value.length) {
        emit('submit', str.value)
    }
}

</script>

<style scoped>
.offcanvas {
    border-top-right-radius: 30px;
    border-top-left-radius: 30px;
    padding-top: 10px;
}

.input-group-text {
    background-color: #fff !important;
    /* border-left: none !important; */
    border-radius: 30px;
    /* margin-right: 600px; */
    border-color: #c5c2c2;
}

.input-group-text .bi {
    font-size: 24px;
    cursor: pointer;
    color: #a5a3a3;
}

.bi:hover {
    color: #111;
}

input {
    border-right: none !important;
    border-radius: 30px;
    padding-left: 30px !important;
    border-color: #c5c2c2;
}

input:focus {
    border-color: #c5c2c2;
}

@media screen and (max-width: 767px) {
    .input-group-text .bi {
        font-size: 16px;
    }
}






.fixed-bottom-btn {
    position: fixed;
    bottom: 0;
    right: 0;
    z-index: 999;
}


.floatPanel {
    margin-bottom: 80px;
    padding-right: 50px;
    display: flex;
    z-index: 999;
    position: relative;
    transition: all ease-in-out 0.4s;
}

@media screen and (max-width: 767px) {
    .floatPanel {
        padding-right: 20px;
    }
}

.floatPanel>span {
    font-size: 14px;
    background-color: #FF3C00;
    color: #fff !important;
    padding: 16px 20px;
    border-radius: 100%;
}

.cnvasSearch {
    padding: 11px;
}
</style>