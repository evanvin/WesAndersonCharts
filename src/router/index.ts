import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import RatingsView from '../views/RatingsView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/actors',
      name: 'actors',
      // route level code-splitting
      // this generates a separate chunk (Actors.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/ActorsView.vue')
    },
    {
      path: '/ratings',
      name: 'ratings',
      // route level code-splitting
      // this generates a separate chunk (Actors.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: RatingsView
    }
  ]
})

export default router
