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
                            <h3>Request Free Consultation</h3>
                            <p class="mt-0 pb-10">Get in touch and discover how we can help. We aim to be in touch for a
                                consultation </p>
                        </div>
                        <div class="appointment-form-section">
                            <form action="https://formspree.io/f/myyleorq" method="POST" id="dreamit-form">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form_box mb-30">
                                            <input type="text" name="name" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form_box mb-30">
                                            <input type="email" name="email" placeholder="Email Address">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form_box mb-30">
                                            <textarea name="message" id="message" cols="30" rows="10"
                                                placeholder="Your Message"></textarea>
                                        </div>
                                        <div class="quote_btn text_center">
                                            <button class="btn" type="submit">Send Message</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div id="status"></div>
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
@import '@/assets/template/style.css';
@import '@/assets/template/responsive.css';
@import '@/assets/template/default.css';
@import '@/assets/template/ui-kit.css';
</style>