<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">


      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">Contact</span>
                Us</h1>
            </div>
          </div>
        </div>
      </div>


      <div class="container py-5 animate__animated animate__fadeIn text-black">

        <div class="row gy-4">
          <div class="col-md-6">
            <div class="card h-100 bg-light">
              <div class="card-header bg-light border-0 fw-bold p-4 mb-0">Drop us A Line
                <br>
                <small>Please complete the form below to get in touch with us:</small>
              </div>

              <div class="card-body">
                <div class="appointment-form-section" id="instantform">
                  <form @submit.prevent="submitForm" id="dreamit-form">
                    <div class="row gy-3">

                      <div class="col-lg-12">
                        <input class="form-control form-control-lg" v-model="person.email" type="email"
                          placeholder="Email">
                      </div>
                      <div class="col-lg-6">
                        <input class="form-control form-control-lg" v-model="person.name" type="text" placeholder="Name">
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
          <div class="col-md-6">
            <div class="card h-100 bg-light">
              <div class="card-header bg-light border-0 fw-bold p-4 mb-0">Quick Contact</div>
              <div class="card-body">
                <section class="section text-start">
                  <ol style="list-style: none; margin-top: 0px !important;">
                    <li><i class="bi bi-geo-alt"></i> 68, Randle Avenue, Surulere, Lagos, Nigeria.</li>

                  </ol>
                </section>

                <section class="section text-start">
                  <ol style="list-style: none; margin-top: 0px !important;">
                    <li><a href="tel:+2348163083253"><i class="bi bi-telephone"></i> +2347089695583;</a></li>
                    <!-- <li><a href="tel:2348023647417"><i class="bi bi-telephone"></i> +2348023647417;</a></li> -->
                    <li><a href="tel:+2348035849127"><i class="bi bi-telephone"></i> +2347011677430.</a></li>
                    <li><a href="https://api.whatsapp.com/send?phone=+2348023647417&text=__">
                        <i class="bi bi-whatsapp"></i> +2348023647417
                      </a></li>
                  </ol>
                </section>

                <section class="section text-start">
                  <ol style="list-style: none; margin-top: 0px !important;">
                    <li class="small"><a href="mailto:qsmtrainingconsulting@gmail.com">
                        <i class="bi bi-envelope"></i> qsmtrainingconsulting@gmail.com</a>
                    </li>
                  </ol>
                </section>

                <section class="section text-start">
                  <div style="width: 100px;" class="h5 ms-4 social-media d-flex justify-content-between">
                    <div>
                      <a href="https://web.facebook.com/qsm.qsm.902/">
                        <i class="bi bi-facebook"></i>
                      </a>
                    </div>
                    <div>
                      <a href="https://www.linkedin.com/in/qsm-training-08138818a/recent-activity/">
                        <i class="bi bi-linkedin"></i>
                      </a>
                    </div>
                    <div>
                      <a href="https://instagram.com/qsmtrainingandconsulting?igshid=ZGUzMzM3NWJiOQ==">
                        <i class="bi bi-instagram"></i>
                      </a>
                    </div>
                  </div>
                </section>

              </div>
            </div>
          </div>
        </div>




      </div>
    </section>

    <whatsappChat />
    <FooterComponent />
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

<style>
.section {
  margin-block: 27px;
  font-size: 16px;
  /* text-align: justify; */
}



.section .title {
  font-weight: bold;
  font-size: 1.2rem;
}
</style>
