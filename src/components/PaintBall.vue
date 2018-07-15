<template>
  <div class="paintball">
    <svg class="site-logo" viewBox="0 0 491 380" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M0 0H49V131C49 135.418 45.4183 139 41 139H8C3.58172 139 0 135.418 0 131V0Z" transform="translate(186 218)" fill="#9B9B9B"/>
      <path d="M0 8C0 3.58172 3.58172 0 8 0H124V36H8C3.58172 36 0 32.4183 0 28V8Z" transform="translate(0 147)" fill="#9B9B9B"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M8 0C3.58172 0 0 3.58172 0 8V62C0 66.4183 3.58173 70 8 70H308V69.986C308.332 69.9953 308.666 70 309 70C328.33 70 344 54.33 344 35C344 15.67 328.33 0 309 0C308.666 0 308.332 0.00468445 308 0.0140076V0H8Z" transform="translate(147 131)" fill="#9B9B9B"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M111 99.9115V100H50H49V99.9902C21.8473 99.4575 0 77.2801 0 50C0 22.7199 21.8473 0.542465 49 0.00979614V0H50H111V0.0885162C111.992 0.0297852 112.993 0 114 0C141.614 0 164 22.3858 164 50C164 77.6142 141.614 100 114 100C112.993 100 111.992 99.9702 111 99.9115Z" transform="translate(168)" fill="#9B9B9B"/>
      <rect width="22" height="31" transform="translate(239 100)" fill="#9B9B9B"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M174 69C162 28.5001 174 5.5 182.5 0H63.5C63.5 0 63.5 6 51 24L51.6602 24.4801C50.6111 26.062 50 27.9596 50 30C50 35.5228 54.4771 40 60 40C64.6571 40 68.5706 36.8165 69.6832 32.5069L80 16L94 62L52.7584 60.5061C40 59 39 48 39 48L22 0H0L18.0867 55.5061C18.0867 55.5061 26 72.5 40 80L102 88L109.327 111.273L120.536 153.109C121.68 157.376 126.067 159.909 130.334 158.766L186.106 143.822C190.373 142.678 192.906 138.291 191.763 134.024L176.751 78L176.191 78.1502C174.876 72.6244 174 69 174 69Z" transform="translate(272 220)" fill="#9B9B9B"/>
    </svg>
    <h2 class="site-title">{{title}}</h2>
    <button type="button">Join Map</button>
    <a href="#settings">settings</a>
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
    font-size: 20px;
    display: block;
    border: none;
    color: #fff;
    background-color: hsla(248, 100%, 76%, 1);
    border-radius: 6px;
    margin: 0 auto .5em;
    padding: .5em 1em;
    box-shadow: 4px 4px 0px #000;
    transition: .25s;
  }
  button:hover {
    box-shadow: 2px 2px 0px #000;
  }
</style>
