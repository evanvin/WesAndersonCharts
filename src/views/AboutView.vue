<template>
  <div class="about">
    <h1>This is an about page</h1>
    <ul v-for="actor in actors" :key="actor[0]">
      <li>
        {{ actor[0] }}
        <ol>
          <li v-for="role in actor[1]" :key="role['role']">
            {{ role['role'] }}
          </li>
        </ol>
      </li>
    </ul>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>

<script>
import rolesData from '../../data/roles.json'

const as = rolesData['actors']
console.log(as)
const actors = Object.entries(as)
  .sort(([, a], [, b]) => b.length - a.length)
  .slice(0, 10)

console.log(actors)

export default {
  data() {
    return {
      actors
    }
  }
}
</script>
