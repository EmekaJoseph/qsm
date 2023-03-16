<template>
    <div class="container">
        <div class="row justify-content-center gy-3">

            <div class="col-lg-5">
                <div class="card bg-white rounded-4 h-100">
                    <div class="card-header bg-transparent fw-bold  border-0">New Trainings</div>
                    <div class="card-body">
                        <form class="row gy-3">
                            <div class="col-md-12">
                                <label>Training Title:</label>
                                <input type="text" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <label>Training Info:</label>
                                <textarea class="form-control" rows="4"></textarea>
                            </div>

                            <div class="col-md-12">
                                <label>Training Venue:</label>
                                <input type="text" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>Start Date:</label>
                                <input type="date" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>End Date:</label>
                                <input type="date" class="form-control">
                            </div>

                            <div class="col-md-12">
                                Add Image (optional)
                                <input type="file" accept="image/jpeg, image/png, image/jpg" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <button type="submit" class="btn theme-btn float-end">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <div class="card bg-white rounded-4 h-100">
                    <div class="card-header bg-transparent fw-bold  border-0"> <i
                            class="bi bi-circle-fill text-success xsmall"></i> Active Trainings</div>
                    <div class="card-body">


                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <div class="card bg-white rounded-4 h-100">
                    <div class="card-header bg-transparent fw-bold  border-0">Past Trainings</div>
                    <div class="card-body">


                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script setup lang="ts">

</script>

<style scoped></style>