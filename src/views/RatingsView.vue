<template>
  <div class="ratingsgraphic">
    <div class="roles" v-for="(movie, i) in movies" :key="movie[0]">
      {{ movie['vote_average'] }}
      <img
        class="avatar"
        :src="'https://image.tmdb.org/t/p/original/' + movie['backdrop_path']"
        alt=""
      />
    </div>
  </div>
</template>

<!-- popover css -->
<!-- https://codepen.io/chocochip/pen/zYxMgRG -->

<style>
@media (min-width: 1024px) {
  .avatar {
    padding: 0.25em;
    border-radius: 9999px;
    object-fit: cover;
    width: 10em;
    height: 10em;
    box-shadow: rgb(255, 255, 255) 0px 0px 0px 0px, rgb(209, 213, 219) 0px 0px 0px 2px,
      rgba(0, 0, 0, 0) 0px 0px 0px 0px;
  }
}
</style>

<script>
import moviesData from '../../data/movies.json'

export default {
  data() {
    return {
      movies: []
    }
  },
  mounted() {
    this.getRatings()
  },
  methods: {
    async getRatings() {
      const options = {
        method: 'GET',
        headers: {
          accept: 'application/json',
          Authorization:
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTI4ZjhhZjAzZWFjZTFkZDc4MDRjZTIwNjE0NDg2MiIsInN1YiI6IjY0OTllYjg2YmJkMGIwMDEwNjZmZGNkOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p7NAarkhMNrWJgwEY6XbV3P9m8jYBMemSOhUXaq-1UM'
        }
      }

      let movies = []

      for (const [_, value] of Object.entries(moviesData['movies'])) {
        const res = await fetch(
          `https://api.themoviedb.org/3/movie/${value['tmdb_id']}?language=en-US`,
          options
        )

        const finalRes = await res.json()

        movies.push(finalRes)
      }

      // Sort array by rating [desc]
      movies = movies.sort(
        (a, b) =>
          b['vote_average'] - a['vote_average'] ||
          b['vote_count'] - a['vote_count'] ||
          a['original_title'].localeCompare(b['original_title'])
      )

      this.movies = movies
    }
  }
}
</script>
