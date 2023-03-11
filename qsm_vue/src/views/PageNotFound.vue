<template>
    <div class="container">
        <div>
            <div class="large text-center" style="font-size: 8rem"><i class="bi bi-exclamation"></i></div>
            <div class="text-center">We do not recognise this URL <br>
                Go to <router-link to="/" class=" text-wrap text-primary"> Home Page</router-link>
            </div>
        </div>
    </div>
</template>
<style scoped>
.container {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>