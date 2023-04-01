<template>
  <div>
    <MainHeaderComponent />

    <section class="body-section">


      <div class="other-page-hero">
        <div class="container">
          <div class="row gx-4">
            <div class="col-lg-6 col-sm-10">
              <h1 class="main-title animate__animated animate__slideInLeft"><span class="text-muted">About</span> Quality
                System Management (QSM)</h1>
            </div>

            <!-- <div class="col-md-6 d-none d-lg-block">
              <div class="d-flex justify-content-center align-content-center">
                <img src="@/assets/images/hero/side.png" width="46%" alt="">
              </div>
            </div> -->

          </div>
        </div>
      </div>


      <div class="container py-5 animate__animated animate__fadeIn text-black">

        <section class="section" id="history">
          <div class="title">Who We Are</div>
          Quality System Management was founded in the year 2001 and was rebranded to QSM Training & Consulting Limited in
          the year 2015 with headquarter in Lagos, Nigeria. QSM Training and Consulting Limited is a leading Training and
          Consulting firm, serving clients across Africa. Our Staff represents a diverse spectrum of professional
          disciplines, ranging from, Pharmacists, Foods Scientists, Biochemist, Microbiologist, Chemist, Regulatory
          Experts and practicing Engineers. We also have in our employment seasoned administrators, accountants and a team
          of ICT experts. Our robust collaboration with different government agencies, professional bodies, the academia
          and industries within are sphere of operations account for our sustainable success.
          <p>
            Our motivation was the rapid changing landscape in quality assurance and quality management requirements and
            our commitment to capacity building for personnel in the food, pharmaceutical, cosmetic, diagnostics and
            allied fields. Our client spectrum continues to expand extending beyond the shores of Nigeria. We host regular
            group advertised training, workshop, seminar, conference and exhibition. Our clients have ranked our in-house
            training and facility audit as among the best in Nigeria. Our monthly Newsletter is a platform to discuss
            contemporary issues as they emerge, forecast future trends and Showcase Company's profile and advertise their
            products. Our cartoon corner can best be described as unveiling. Our goal is to help companies maintain
            standards and quality for customers' satisfaction.
          </p>
          <p>QSM Training &amp; Consulting programmes have helped clients design and implement projects, improve
            efficiency,
            enhance human capacity and build great institutions.
            At QSM Training &amp; Consulting we learn to train and bring the most current knowledge to your corridor.

          </p>
        </section>

        <!-- <section class="section">
          <div class="title">History</div>
          Quality System Management was founded in the year 2001 and was rebranded to QSM
          Training & Consulting Limited in the year 2015 with headquartered in Lagos, Nigeria.
          QSM Training & Consulting Limited (QTC) is a leading Training and Consulting firm,
          serving clients across West Africa. Our Staff represents a diverse spectrum of
          professional, ranging from Foods / Scientists, Technologists, Pharmacists,
          Pharmacologist, Microbiologists, Chemists, Biochemists, and Engineers.
          <p>For 18 years, we have sustained integrity and proficiency in designing trainings, seminar,
            workshop and facility audit for the Food, Pharmaceutical, Water and Cosmetic
            Manufacturers. Our reputation for quality service is attested to by participants who
            attend our trainings.
          </p>
          <p>
            QTC programmes have helped clients design and implement projects, improve
            efficiency, enhance human capacity and build great institutions.
            At QTC we train and bring the most current knowledge to your organization.
          </p>
        </section> -->

        <section class="section">
          <div class="title">Vision</div>
          To be a leading innovative training and consulting firm on quality assurance and regulatory guidelines in food,
          pharmaceutics and allied industries.
        </section>
        <section class="section">
          <div class="title">Mission</div>
          To build capacity in skill and regulatory requirements for the food, pharmaceutical and allied industries for
          increase in productivity, best practices and sustainability.
        </section>
        <section class="section">
          <div class="title">Goal</div>
          To help companies maintain standards and quality for customers’ satisfaction.
        </section>

        <section class="section text-start" id="trainings">
          <div class="title">OUR SEMINARS/TRAINING MODULES</div>
          <ol style="list-style: circle; margin-top: 0px !important;">
            <li>Regulatory Requirements for Product Licencing.</li>
            <li>Good Practices for Quality Control Laboratories.</li>
            <li>Water Quality Management.</li>
            <li>Good Manufacturing Practices in Pharmaceutical, Water, Food and Cosmetics
              Industries.</li>
            <li>Managing Materials (Raw Materials, Packing/Labelings, Finished Materials).</li>
            <li>Good Documentation Practices.</li>
            <li>Food Safety Training.</li>
            <li>Good Storage Practice.</li>
            <li>Achieving Quality &amp; Compliance Excellence.</li>
            <li>Good Warehousing Practices.</li>
            <li>Good Hygiene Practices.</li>
            <li>System Development for Microbiology in Pharmaceutical, Food and Cosmetics
              Industries.</li>
            <li>Proactive Approach to Good Production Practices in Sterile Products Plant.</li>
            <li>Equipment System Qualification.</li>
            <li>Hazard Analysis Critical Control Point (HACCP).</li>
            <li>Specialized Trainings .</li>
          </ol>
        </section>

        <section class="section" id="consulting">
          <div class="title">CONSULTING SERVICES</div>
          <ol style="list-style: circle; margin-top: 0px !important;">
            <li>Special Training/Seminars </li>
            <li>Collaboration Training </li>
            <li>Facility Audit </li>
          </ol>
        </section>

        <section class="section">
          <div class="title">OUTSOURCING SERVICES</div>
          <div>
            QSM Training &amp; Consulting Ltd Outsourcing Services is among the leading provider of outsourcing services
            to
            multiple clients across a number of sectors in the Nigerian economy. Our client base includes multi-nationals,
            as well as very successful indigenous organizations.
          </div>
          <div>
            <span>Our consultancy and outsourced services include:</span>
            <ol style="list-style: circle; margin-top: 0px !important;">
              <li> Laboratory services</li>
              <li> Fumigation and pest control services</li>
              <li> Equipment maintenance and calibration services</li>
              <li> Water treatment and engineering services</li>
              <li> Product registration and renewal of licenses with regulatory agencies</li>
              <li> Pre-inspection and audit services</li>
              <li> Business proposal and contract bidding</li>
            </ol>
          </div>

          <span class="px-1 bg-warning-subtle rounded-1">Our over-arching goal is to ensure that our clients achieve
            and exceed their business objectives. Every
            member of our team is committed to delivering the excellence and professionalism required to deliver on this
            promise.</span>
        </section>

        <section class="section text-start">
          <div class="title">PROFESSIONAL BODY MEMBERSHIP</div>
          <div class="text-success fs-5">Nigeria Institute of Training and Development (<b>NITAD</b>)</div>
        </section>

        <section class="section text-start">
          <div class="title">TRAINING DONE SO FAR:</div>
          <ol>
            <li v-for="(trn, index) in trainings.list" :key="index">
              {{ trn.title }}
              <ol style="list-style: upper-roman;">
                <li v-for="list in trn.list" :key="list">
                  {{ list.name }} - <b>{{ list.date }}</b> </li>
              </ol>
            </li>
          </ol>
        </section>

        <section class="section" id="faculty">
          <div class="title mb-3">ADMINISTRATIVE STAFF:</div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1">
              <div class="theme-color fw-bold">Chinyere Ikeora</div>
              <div>
                <b>Career designation:</b> Regulatory Affairs/cGMP &amp; HSE Compliance Professional.
              </div>
              <div>
                <b>Job designation:</b> Managing Director.
              </div>
              <div>
                <b>Professional Designation/Affiliation:</b> IASP, FIPMA.
              </div>
              <div>
                <b>Competencies:</b> Regulatory Affairs, CGMP and HSE compliance Management & Training Facility Audit
              </div>
            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">
                <img src="@/assets/images/staff/staff_chinyere.jpg" alt="">
              </div>
            </div>
          </div>


          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1">
              <div class="theme-color fw-bold">Prof. Louis Egwari</div>
              <div>
                <b>Career designation:</b> Director, Research and Training, QSM Training and Consulting Ltd.
              </div>
              <div>
                <b>Job designation:</b> Professor of Microbiology
              </div>
              <div>
                <b>Professional Designation/Affiliation:</b> MIPAN (IPAN), MNIFST (NIFST), MIMLSN (IMLSN), MISID (ISID)
              </div>
              <div>
                <b>Competencies:</b> Epidemiology of Infectious Diseases, Antimicrobial Agents and Drug Resistance, Water,
                Food and Pharmaceutical Microbiology.
              </div>
            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">
                <img src="@/assets/images/staff/staff_prof.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1">
              <div class="theme-color fw-bold">Emeka Chukwurah</div>
              <div>
                <b>Career designation:</b> Regulatory Affairs/CGMP Compliance Professional.
              </div>
              <div>
                <b>Job designation:</b> Resource Person
              </div>
              <div>
                <b>Professional Designation/Affiliation:</b> ASQ Certified Food Safety &amp; Quality Auditor
              </div>
              <div>
                <b>Competencies:</b> Regulatory Affairs, Regulatory Crises Management, CGMP &amp; HACCP Compliance
                Management,
                Quality Risk Management.
              </div>
            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">
                <img src="@/assets/images/staff/staff_emeka.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1">
              <div class="theme-color fw-bold">Dr. Olayemi O. Akinnola</div>
              <div>
                <b>Career designation:</b> Senior Lecturer, Covenant University.
              </div>
              <div>
                <b>Job designation:</b> Resource Person
              </div>
              <div>
                <b>Professional Designation/Affiliation:</b> MISID (ISID).
              </div>
              <div>
                <b>Competencies:</b> Specialization: Medical Microbiology, Pharmaceutical Microbiology and Antibiotic
                Stewardship.
              </div>
            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">
                <img src="@/assets/images/staff/staff_olayemi.jpg" alt="">
              </div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1">
              <div class="theme-color fw-bold">Elochukwu Adibo</div>
              <div>
                <b>Career designation:</b> Internationally Certified Biomedical Scientist.
              </div>
              <div>
                <b>Job designation:</b> Resource Person
              </div>
              <div>
                <b>Professional Designation/Affiliation:</b> Institute of Biomedical Science, Royal Microscopic Society
                both in the UK, Register of the Health Care Profession Council in the UK, Fellow of Chartered Institute of
                Management and Leadership of the United States of America.
              </div>
              <div>
                <b>Competencies:</b> Laboratory Diagnosis/Procedures, Quality Management System, Leadership and Management
                in Health, Infection Prevention and Control
              </div>
            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">
                <img src="@/assets/images/staff/staff_elochukwu.jpg" alt="">
              </div>
            </div>
          </div>

        </section>
      </div>
    </section>


    <FooterComponent />
  </div>
</template>



<script setup lang="ts">
import { useTraningsHistory } from '@/store/trainingHistory';

const trainings = useTraningsHistory();

</script>

<style>
.section {
  margin-block: 27px;
  font-size: 16px;
  /* text-align: justify; */
}

.faculty-span {
  border-bottom: 1px solid #ccc;
  padding-bottom: 20px;
}

.section .title {
  font-weight: bold;
  font-size: 1.2rem;
}

/* li {
  margin-block: 7px;
  margin-left: 20px;
} */


.pic-span {
  /* height: 300px; */
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden
}

.pic-span img {
  flex-shrink: 0;
  width: 60%;
  border: 2px solid #d1cfcf;
  /* min-height: 100%; */
}


@media (max-width: 994px) {
  .main-title {
    font-size: 25px !important;
  }

  .section {
    text-align: justify;
  }

  .pic-span {
    display: flex;
    justify-content: start;
  }
}
</style>
