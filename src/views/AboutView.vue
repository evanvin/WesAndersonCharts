<template>
  <div class="rolegraphic">
    <div class="actor" v-for="actor in actors" :key="actor[0]">
      <!-- {{ actor[0] }} -->
      <div class="item" v-for="role in actor[1]" :key="role['role']">
        <!-- {{ role['role'] }} -->
      </div>
    </div>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .rolegraphic {
    /* min-height: 100vh; */
    display: flex;
    flex-direction: row;
    align-items: center;
  }

  .rolegraphic > .actor {
    margin: 24px 24px;
    display: flex;
    flex-direction: column;
    align-self: flex-end;
  }

  .rolegraphic > .actor > .item {
    width: 24px;
    height: 12px;
    background-color: blue;
    margin: 1.5px 1.5px;
    display: flex;
    flex-direction: column-reverse;
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
