<template>
    <div class="thForm">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header border-0  fw-bold  text-center py-3">QSM
                            <span class="text-muted">| Admin</span>
                        </div>
                        <div class="card-body py-5 px-4">
                            <form class="row gy-3">
                                <div class="col-md-12">
                                    <label>username</label>
                                    <input type="text" class="form-control form-control-lg">
                                </div>
                                <div class="col-md-12">
                                    <label>password</label>
                                    <input type="password" class="form-control form-control-lg">
                                </div>
                                <div class="col-md-12 mt-5">
                                    <button @click.prevent="" class="btn theme-btn btn-lg w-100">Login</button>
                                    <!-- <button v-else disabled class="btn theme-btn btn-lg w-100">Please Wait..</button> -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script setup lang="ts">

</script>

<style scoped>
.thForm {
    min-height: 100vh;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-pack: center;
    justify-content: center;
    -ms-flex-align: center;
    align-items: center;
    transition: 1.8s ease-in-out;
    overflow: hidden;
    background-color: #eee;
}
</style>