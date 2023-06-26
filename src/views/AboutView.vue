<script setup>
import ArrowIcon from '../components/icons/IconArrow.vue'
</script>

<template>
  <div class="rolegraphic">
    <div class="stacks">
      <div class="roles" v-for="(actor, i) in actors" :key="actor[0]">
        <div
          class="role"
          v-for="role in actor[1]"
          :key="role['role']"
          :style="{ 'background-color': colors[i % colors.length] }"
          @mouseover=";(actor_name = actor[0]), (character = role)"
          @mouseleave=";(character = {}), (actor_name = '')"
        />
      </div>
    </div>
    <div class="actors">
      <div
        class="actor"
        v-for="(actor, i) in actors"
        :key="actor[0]"
        :style="{ color: colors[i % colors.length] }"
      >
        <span class="surname"> {{ actor[0].split(' ')[1] }} </span>
        <span class="firstname">
          {{ actor[0].split(' ')[0] }}
        </span>
      </div>
    </div>
  </div>
  <div class="arrows">
    <ArrowIcon class="right-arrow" />
    <ArrowIcon class="left-arrow" />
  </div>
  <div class="info">
    <span class="title"
      ><ArrowIcon class="left-arrow" />Role Information<ArrowIcon class="right-arrow"
    /></span>
    <div v-if="actor_name != ''" class="content">
      <span class="actor-bold">{{ actor_name }}</span>
      <span v-if="!character['is_main']">played the role of</span>
      <span v-if="character['is_main']">played the titular role of</span>
      <span class="actor-bold">{{ character['role'] }}</span>
      <span>in</span>
      <span class="actor-bold"
        >{{ movies[character['movie']]['name'] }} ({{ movies[character['movie']]['year'] }})</span
      >
    </div>
  </div>
</template>

<!-- popover css -->
<!-- https://codepen.io/chocochip/pen/zYxMgRG -->

<style>
@media (min-width: 1024px) {
  .rolegraphic {
    /* min-height: 100vh; */
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    overflow-x: scroll;
  }

  .rolegraphic::-webkit-scrollbar {
    display: none;
    scrollbar-width: none;
  }

  .actors {
    display: flex;
    flex-direction: row;
  }

  .actor {
    margin: 8px 16px 16px 16px;
    width: 100px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .stacks {
    display: flex;
    flex-direction: row;
    align-items: flex-end;
  }

  .roles {
    margin: 16px 16px 8px 16px;
    width: 100px;
    display: flex;
    flex-direction: column-reverse;
    align-items: center;
  }

  .role {
    width: 32px;
    height: 16px;
    margin: 2px 2px;
    border-radius: 2px;
    --start-bright: 1;
    --incr-tint: 0.05;
  }

  .role:hover {
    background-color: #58a1d9 !important;
  }

  .role:nth-child(1) {
    filter: brightness(var(--start-bright));
  }

  .role:nth-child(2) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 1)));
  }

  .role:nth-child(3) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 2)));
  }

  .role:nth-child(4) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 3)));
  }

  .role:nth-child(5) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 4)));
  }

  .role:nth-child(6) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 5)));
  }

  .role:nth-child(7) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 6)));
  }

  .role:nth-child(8) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 7)));
  }

  .role:nth-child(9) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 8)));
  }

  .role:nth-child(10) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 9)));
  }

  .role:nth-child(11) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 10)));
  }

  .role:nth-child(12) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 11)));
  }

  .role:nth-child(13) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 12)));
  }

  .role:nth-child(14) {
    filter: brightness(calc(var(--start-bright) + (var(--incr-tint) * 13)));
  }

  span.surname {
    font-family: 'Belanosima';
  }

  span.firstname {
    font-family: 'Shrikhand';
    font-size: 12px;
    margin-top: -2px;
  }

  .arrows {
    display: flex;
    justify-content: space-between;
    grid-column-start: 2;
  }

  .arrows svg > g > path {
    fill: slategrey;
  }

  .arrows svg {
    width: 48px;
    height: 48px;
  }

  .info {
    grid-column-start: 2;
    width: 100%;
    height: 200px;
    display: flex;
    flex-direction: column;
    margin: 32px 32px;
    align-items: center;
    color: #fd6467;
  }

  .info > .title {
    font-family: 'Tangerine';
    font-size: 40px;
  }

  .left-arrow {
    transform: rotate(45deg);
    margin-right: 12px;
  }

  .right-arrow {
    transform: rotate(-135deg);
    margin-left: 12px;
  }

  .info > .content {
    display: flex;
    flex-direction: column;
    align-items: center;
    font-family: 'Belanosima';
    font-weight: 400;
  }

  .info > .content > .actor-bold {
    font-family: Futura;
    font-weight: 700;
  }
}
</style>

<script>
import rolesData from '../../data/roles.json'
import moviesData from '../../data/movies.json'

const colors = [
  '#74A089',
  '#CB2314',
  '#0B775E',
  '#F8AFA8',
  '#78B7C5',
  '#EBCC2A',
  '#F21A00',
  '#00A08A',
  '#F98400',
  '#85D4E3',
  '#F4B5BD',
  '#FD6467',
  '#5B1A18',
  '#E6A0C4',
  '#C6CDF7'
]

const as = rolesData['actors']
const actors = Object.entries(as).sort(
  (a, b) => b[1].length - a[1].length || a[0].localeCompare(b[0])
)

export default {
  data() {
    return {
      actors,
      colors,
      character: {},
      actor_name: '',
      movies: moviesData['movies']
    }
  }
}
</script>
