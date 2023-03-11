<template>
    <div class="d-flex justify-content-center align-items-center">
        <div style="font-size: 6rem;" class="text-muted2 text-center">
            <i class="bi bi-slash-circle"></i> <br>
            <h5 class="text-muted2 text-center">{{ str }}</h5>
        </div>
    </div>
</template>

<script setup lang="ts">
defineProps({
    str: {
        type: String,
        default: '',
        required: true
    }
})

</script>
