<template>
  <div class="paintball">
    <h2 class="site-title">{{title}}</h2>
    <button type="button">Join Map</button>
    <a href="">settings</a>
  </div>
</template>

<script>
export default {
  name: 'PaintBall',
  props: {
    title: String
  }
}
</script>

<style scoped>
  .site-title {
    text-transform: uppercase;
  }
  .paintball {
    max-width: 600px;
    margin: 0 auto;
    text-align: center;
  }
  button {
    display: block;
    border: none;
    color: #fff;
    background-color: hsla(248, 100%, 76%, 1);
    border-radius: 6px;
    margin: 0 auto .5em;
    padding: .5em 1em;
  }
</style>
