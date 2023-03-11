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
          QSM Training & Consulting Ltd Outsourcing Services is amongst the leading provider of
          outsourcing services to multiple clients across a number of sectors in the Nigerian economy.
          Our client base includes multi-nationals, as well as very successful indigenous organizations.
          <p>
            We leverage our experience working with organizations in key sectors of the |Nigerian
            economy, the knowledge base of the QSM Training & Consulting Ltd, as well as its large pool of
            experience seekers to deliver world class outsourcing solutions to our clients.
          </p>
          <p>We have developed, tested & implemented various outsourcing processes and solutions
            uniquely tailored to the Nigerian economy environment guaranteeing our clients a seamless
            transition as they seek to strategically optimize their resources.
          </p>
          <p>
            Our over-arching goal is to ensure that our clients achieve and exceed their business objectives.
            Every member of our team is committed to delivering the excellence and professionalism
            required to deliver on this promise.
          </p>
        </section>

        <section class="section">
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
        </section>

        <section class="section">
          <div class="title">Vision & Mission</div>
          VISION: We envision in delivering, sustainable Human Capital for the Future through training <br>
          MISSION: Our mission is to partner with organization in providing human capital development <br>
          GOAL: To develop skills and increase productivity of your personnel.
        </section>

        <section class="section text-start">
          <div class="title">SEMINARS/TRAINING CONDUCTED IN LAST FIVE YEARS</div>
          <ol style="list-style: circle;">
            <li>Regulatory Requirements for Product Licencing.</li>
            <li>Good Practices for Quality Control Laboratories.</li>
            <li>Water Quality Management (Module 1).</li>
            <li>Good Manufacturing Practices in Pharmaceutical, Water, Food and Cosmetics
              Industries.</li>
            <li>Good Practices for Quality Control Laboratories.</li>
            <li>Managing Materials (Raw Materials, Packing/Labellings, Finished Materials.</li>
            <li>Good Documentation Practices.</li>
            <li>Food Safety Training.</li>
            <li>Good Storage Practice.</li>
            <li>Achieving Quality & Compliance Excellence.</li>
            <li>Good Warehousing Practices.</li>
            <li>Good Hygiene Practices.</li>
            <li>System Development for Microbiology in Pharmaceutical, Food and Cosmetics
              Industries.</li>
            <li>Proactive Approach to Good Production Practices in Sterile Products Plant.</li>
            <li>Equipment System Qualification.</li>
            <li>Hazard Analysis Critical Control Point (HACCP).</li>
          </ol>
        </section>

        <section class="section text-start">
          <div class="title">TRAINING DONE SO FAR:</div>
          <ol>
            <li v-for="(trn, index) in trainings.list" :key="index">
              {{ trn.title }}
              <ol style="list-style: circle;">
                <li v-for="list in trn.list" :key="list">
                  {{ list.name }} - <b>{{ list.date }}</b> </li>
              </ol>
            </li>
          </ol>
        </section>

        <section class="section" id="faculty">
          <div class="title">FACULTY:</div>
          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1"><b>Prof. Louis Egwari</b> Chair, Training QSM training and Consulting
              Ltd. He has over
              30 years of work experience in academics and hospital duties and administration.
              Seven years work experience in the Drug Production Unit of Pharmacy
              Department Lagos University Teaching Hospital, Idi-Araba and 23 years of
              academic and administrative experience in College of Medicine Idi-Araba,
              University of Lagos and Covenant University. He is a member of the Institute of
              Public Analysts of Nigeria (IPAN), Nigerian Institute of Food Science and
              Technology (NIFST) and the Association of Medical Laboratory Scientist of Nigeria
              (AMLSN). He is also a member of the Anaerobe Society of the Americas (ASA) and
              the International Society of Infectious Diseases (ISID). He is a researcher, an
              author and a reviewer for many Journals. He is also external examiner to many
              Institutions both National and International. He has 3 patents all from microbial
              fermentation. He is a trainer, writer and speaker on diverse topics related to
              medical microbiology, food microbiology, Pharmaceutical microbiology and
              Water microbiology and chemistry. His expertises are in proposal writing, project
              development, product development and capacity building.</div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">PHOTO</div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1"><b>Dr (Mrs) Agnes Yemisi Asagbra - </b> Holds a PhD in Food and
              Industrial Microbiology. She is presently the Director of Production, Analytical and
              Laboratory Management in the Federal Institute of Industrial Research Oshodi
              (FIIRO). She is QMS and FSMS auditor with DQS. She is also an IRCA auditor. She
              is passionate about safety.</div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">PHOTO</div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1"><b>Emeka Chukwurah C. - </b> is an experienced Regulatory Affairs,
              cGMP Compliance Professional and ISO 9001:2015 Auditor. He has over 14 years work experience
              that spans the academia, Non-Governmental Organization, government
              administration and FMCG. Out of the 14 yrs. he spent Eleven (11) years in
              Establishment Inspection Directorate and Food Safety and Applied Nutrition
              Directorate of NAFDAC as a water and food safety auditor. Currently, he consults
              for companies on Regulatory, compliance and quality issues.</div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">PHOTO</div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1"><b>Opaleye, Nureni Babatunde – MBA (Master in Business
                Administration) - </b> University of Lagos, B.Sc (Hons) Microbiology – University of Lagos, OND (Science
              Technology) – The polytechnic Ibadan, Nigeria, Member Nigerian Society for Microbiology (MNSM),
              Member Association of Industrial Microbiologist of Nigeria (MAIMN), Member
              Standards Organization of Nigeria (Certified Systems Lead Auditor), Member Nigeria
              Institute of Food Science and Technology (NIFST).
            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">PHOTO</div>
            </div>
          </div>

          <div class="row mb-4 faculty-span">
            <div class="col-lg-8 order-2 order-lg-1"><b>James Oyeyipo - (Training Manager) - </b> Accountant by training,
              a highly motivated and result driven young man who has over
              seven years of invaluable experience in leading and developing a successful team, skilled
              in purchasing/supply management, accounting, financial management and marketing
              with extra curricula skill in cinematographic and skill photography. His working
              experience has enabled him to develop good individual and team playing abilities,
              interpersonal skills and a strong ability to work within set targets even when tight
              deadlines are set.

            </div>
            <div class="col-lg-4 order-1 order-lg-2">
              <div class="pic-span">PHOTO</div>
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
@media (max-width: 994px) {
  .main-title {
    font-size: 25px !important;
  }
}

.section {
  margin-block: 27px;
  font-size: 16px;
  text-align: justify;
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
  height: 200px;
  background-color: var(--bs-light);
}
</style>
