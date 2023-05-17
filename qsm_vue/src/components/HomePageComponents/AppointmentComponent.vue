<template>
    <div class="appointment-section pt-75 pb-75">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-6">
                    <div class="appointment-section-thumb">
                        <img src="@/assets/images/consult/cnst1.jpg" alt="appointment">
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="appointment-content-section pt-40 pb-30 pl-50 pr-50">
                        <div class="appointment-content">
                            <h3>Enquiry Form</h3>
                            <p class="mt-0 pb-10">Need Consultation?, Need to make an enquiry?
                                Get in touch! We aim to
                                be in touch </p>
                        </div>
                        <div class="appointment-form-section" id="instantform">
                            <form @submit.prevent="submitForm" id="dreamit-form">
                                <div class="row gy-3">

                                    <div class="col-lg-12">
                                        <input class="form-control form-control-lg" v-model="person.email" type="email"
                                            placeholder="Email">
                                    </div>
                                    <div class="col-lg-6">
                                        <input class="form-control form-control-lg" v-model="person.name" type="text"
                                            placeholder="Name">
                                    </div>
                                    <div class="col-lg-6">
                                        <input v-maska data-maska="###########" class="form-control form-control-lg"
                                            v-model="person.phone" type="text" placeholder="Phone Number">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="Your message" v-model="person.message" class="form-control"
                                            rows="5"></textarea>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="quote_btn text_center mt-3">
                                            <button v-if="!person.isSending" class="btn" type="submit">Send
                                                Message</button>

                                            <button v-else disabled class="btn" type="submit">Sending..</button>
                                        </div>
                                    </div>
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
import { reactive } from 'vue';
import useFunction from '@/store/functions/useFunction';
import { UsersAPI } from '@/store/functions/axiosManager';
import { vMaska } from "maska"

const user_api = new UsersAPI()

const fxn = useFunction.fx

const person = reactive({
    name: '',
    email: '',
    phone: '',
    message: '',
    isSending: false
})

async function submitForm() {
    if (!person.name || !person.message || !person.email || !person.phone) {
        fxn.Toast('Please complete the form', 'warning')
        return
    }

    person.isSending = true

    try {
        let resp = await user_api.sendMessage(person)
        if (resp.status == 200) {
            fxn.Toast('Thank You for reaching out, we will contact you soon.', 'success')
            person.email = ''
            person.phone = ''
            person.name = ''
            person.message = ''
            person.isSending = false
        }
    } catch (error) {
        fxn.Toast('Network Error, Please try again', 'success')
        person.isSending = false
    }
}
</script>
