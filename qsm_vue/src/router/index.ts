import { createRouter, createWebHistory } from 'vue-router'
import { useAccount } from '@/store/Account'


import HomeView from '../views/HomePage.vue'
import AboutView from '../views/AboutPage.vue'
import ContactView from '../views/ContactPage.vue'
import TrainingsPage from '../views/TrainingsPage.vue'
import MaterialsPage from '../views/MaterialsPage.vue'
// import BlogsPage from '../views/BlogPage.vue'


import AdminLogin from '../views/Admin/AdminLogin.vue'
import AdminLayout from '../views/Admin/AdminLayout.vue'
import AdminDashboard from '../views/Admin/AdminDashboard.vue'
import AdminTrainings from '../views/Admin/AdminTrainings.vue'
import AdminArchive from '../views/Admin/AdminArchive.vue'
import AdminMaterials from '../views/Admin/AdminMaterials.vue'
import AdminSettings from '../views/Admin/AdminSettings.vue'
import AdminBlog from '../views/Admin/AdminBlog.vue'
import AdminNewsLetters from '../views/Admin/AdminNewsLetters.vue'

import PageNotFound from '../views/PageNotFound.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),

  linkActiveClass: 'active',
  routes: [
    { path: '/', name: 'TRAINING & COUNSULTING', component: HomeView },
    { path: '/about', name: 'About', component: AboutView },
    { path: '/contact', name: 'Contact', component: ContactView },
    { path: '/trainings', name: 'Trainings_', component: TrainingsPage },
    { path: '/booktraining', name: 'Book Training', component: () => import('../views/BookTraining.vue'), props: route => ({ query: route.query }) },
    { path: '/materials', name: 'Course Materials', component: MaterialsPage },
    { path: '/blog-home', name: 'Blog Home', component: () => import('../views/BlogPage.vue') },
    { path: '/blog', name: 'Blog', component: () => import('../views/BlogDetails.vue'), props: route => ({ query: route.query }), },
    { path: '/newsletters', name: 'NewsLetters', component: () => import('../views/NewsLetterPage.vue'), props: route => ({ query: route.query }), },

    {
      path: '/admin/login',
      beforeEnter: (to, from, next) => {
        const account = useAccount()
        if (account.state.id) {
          next({ path: '/admin/trainings' });
        }
        else {
          next();
        }
      },
      name: 'Login',
      alias: '/admin',
      component: AdminLogin
    },


    {
      path: '/admin',
      beforeEnter: (to, from, next) => {
        const account = useAccount()
        if (!account.state.id) {
          next({ path: '/admin/login' });
        }
        else {
          next();
        }
      },
      component: AdminLayout,
      children: [
        { path: 'dashboard', name: 'Dashboard', component: AdminDashboard },
        { path: 'trainings', name: 'Trainings', component: AdminTrainings },
        { path: 'archives', name: 'Archives', component: AdminArchive },
        { path: 'materials', name: 'Materials', component: AdminMaterials },
        { path: 'settings', name: 'Settings', component: AdminSettings },
        { path: 'blog', name: 'BlogEdit', component: AdminBlog },
        { path: 'newsletters', name: 'News-Letters', component: AdminNewsLetters },
      ],
    },

    {
      path: '/:pathMatch(.*)*',
      name: '404',
      component: PageNotFound
    },
  ],

  scrollBehavior(to) {
    const page: any = {}
    page.top = 0;
    page.behavior = 'smooth';
    if (to.hash) {
      page.el = to.hash
    }
    return page
  },
})

router.afterEach((to) => {
  document.title = 'QSM | ' + to.name?.toString();
})

export default router
