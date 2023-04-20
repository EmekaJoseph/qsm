<template>
  <div>
    <div class="footer">
      <div class="container">
        <!-- <div class="row footer-hr"> -->
        <div class="row footer-hr justify-content-center">

          <!-- <div class="col-md-6 col-lg-3"> -->
          <div class="col-md-4">
            <div class="widget">
              <div class="about-company">
                <div class="footer-logo">
                  <img src="@/assets/images/footer/logo_footer.png" width="50" alt="Footer-logo">
                </div>
                <p>We train and bring the most current knowledge to your organization. </p>
                <div class="footer-about-social-icon">
                  <ul>
                    <li>
                      <a href="#"><i class="bi bi-facebook"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="bi bi-twitter"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="bi bi-pinterest"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="bi bi-linkedin"></i></a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- <div class="col-md-6 col-lg-3"> -->
          <div class="col-md-4">
            <div class="widget">
              <div class="footer-quick-link">
                <div class="footer-widget-title">
                  <h5>Quick Links</h5>
                </div>
                <div class="footer-quick-link-list">
                  <ul>
                    <li> <router-link to="/">Home</router-link> </li>
                    <li> <router-link to="/about">About Us</router-link> </li>
                    <li><router-link to="/materials">Course Materials</router-link></li>
                    <li><router-link to="/trainings">Trainings</router-link></li>
                    <li><router-link to="/admin">Admin</router-link></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- <div class="col-md-6 col-lg-3"> -->
          <div class="col-md-4">
            <div class="widget">
              <div class="footer-contact">
                <div class="footer-widget-title">
                  <h5>Contacts</h5>
                </div>
                <p><b>Adress: </b> 68, Randle Avenue, Surulere, Lagos, Nigeria.</p>
                <p><b>Phone: </b> +234 816 308 3253; <br>+234 802 364 7417; <br>+234 803 584 9127.</p>
                <p><b>Email: </b> qsmtrainingconsulting@gmail.com</p>

                <div class="mt-4">

                  <a class="text-warning" :href="`${hostURL}/qsm_docu/T_&_C.docx`" download>
                    <i class="bi bi-download"></i> Terms &amp; Conditions..</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="footer-copyright-section">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <div class="footer-copyright-text">
              <p>&copy; {{ (new Date().getFullYear()) }} - QSM all rights reserved. </p>
            </div>
          </div>
          <!-- <div class="col-sm-12 col-md-6">
            <div class="footer-copyright-link">
              <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Services</a></li>
              </ul>
            </div>
          </div> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { hostURL } from '@/store/functions/axiosManager';
</script>

<style scoped>
.active {
  background-color: transparent !important;
}
</style>

