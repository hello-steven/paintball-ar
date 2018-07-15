<template>
  <div id="app">
    <PaintBall title="paintball" v-if="layout === 'landing'"/>
    <PaintBallMap title="Paintball AR" v-else-if="layout === 'map'"/>
  </div>
</template>

<script>
import PaintBall from './components/PaintBall.vue'
import PaintBallMap from './components/PaintBallMap.vue'

export default {
  name: 'app',
  components: {
    PaintBall,
    PaintBallMap
  },
  data: function () {
    return {
      layout: 'map'
    }
  },
  methods: {
    changeView: function (layout) {
      this.layout = layout;
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  padding-top: 60px;
}
.site-logo {
  max-width: 200px;
  margin: 0 auto;
}
</style>
